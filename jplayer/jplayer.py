#!/usr/bin/env python
#from sh import nmap
import tornado.httpserver
#import tornado.websocket
import tornado.ioloop
import tornado.web
import time
#import multiprocessing
import signal
import os
#import re
import yaml


def getconfig():
    with open(os.path.join(os.path.dirname(__file__),
                           'config.yml'), 'r') as configfile:
        config = yaml.load(configfile)
    return config

def generate_filelist(path, baseurl):
    files = []
    #mtime = lambda f: os.stat(os.path.join(path,f)).st_mtime
    for dir in os.walk(path):
        for filename in dir[2]:
            #print(filename)
            fullpathfile = os.path.join(dir[0], filename)
            files.append([filename,
                            baseurl + fullpathfile.replace(path,''),
                            time.ctime(os.stat(fullpathfile).st_mtime)]
                           )
    #print(files)
    return files


class mainhandler(tornado.web.RequestHandler):
    def get(self):
        playerurl = "/player"
        mediapath = getconfig()['media_path']
        filelist = generate_filelist(mediapath, playerurl)
        #sort the list by filename:
        sorted_filelist = sorted(filelist, key=lambda x: x[0].upper())
        self.render('main.tpl', filelist=sorted_filelist)


class allinonehandler(tornado.web.RequestHandler):
    def get(self):
        playerurl = "/videos"
        mediapath = getconfig()['media_path']
        filelist = generate_filelist(mediapath, playerurl)
        #sort the list by filename:
        sorted_filelist = sorted(filelist, key=lambda x: x[0].upper())
        self.render('allinone.tpl', filelist=sorted_filelist)


class videohandler(tornado.web.RequestHandler):
    def get(self, video_path):
        filename = video_path.split('/')[-1]
        self.render('videoplayer.tpl', filename=filename, filepath=video_path)


class videoredirect(tornado.web.RequestHandler):
    def get(self, video_path):
        print("%s requested %s" % (self.request.remote_ip, video_path))
        #print(self.request)
        #redirect = "%s://%s/video_srv/%s" % (self.request.protocol,self.request.host,video_path)
        redirect = "/video_srv/%s" % (video_path)
        print(redirect)
        self.add_header("X-Accel-Redirect", redirect)
        #self.write("")
        #self.flush()
        self.redirect(redirect)


if __name__ == '__main__':
    #tornado application settings
    print(getconfig())

    if getconfig()['standalone']:
        routes = [
            (r'/', allinonehandler),
            (r'/old', mainhandler),
            (r'/player/(.*)', videohandler),
            #(r'/videos/(.*)', videoredirect),
            (r'/videos/(.*)', tornado.web.StaticFileHandler,
             {'path': getconfig()['media_path']}),
        ]
    else:
        routes = [
            (r'/', allinonehandler),
            (r'/old', mainhandler),
            (r'/player/(.*)', videohandler),
            (r'/videos/(.*)', videoredirect),
        ]

    print routes

    settings = {
        'static_path': os.path.join(os.path.dirname(__file__), 'static'),
        'template_path': os.path.join(os.path.dirname(__file__), 'templates')
    }

    ssl_settings = {
        'certfile': os.path.join(os.path.dirname(__file__), 'cert.pem'),
        'keyfile': os.path.join(os.path.dirname(__file__), 'cert.pem')
    }

    application = tornado.web.Application(routes, **settings)

    port_listen = getconfig()['port_listen']

    if os.path.exists(os.path.join(os.path.dirname(__file__), 'cert.pem')):
        http_server = tornado.httpserver.HTTPServer(application,
                                                    ssl_options=ssl_settings)
        print("SSL enabled")
    else:
        http_server = tornado.httpserver.HTTPServer(application)
        print("SSL disabled")

    http_server.listen(port_listen)
    loop = tornado.ioloop.IOLoop.instance()

    def sigint_handler(signum, frame):
        print('signal handler called with %s, frame %s' % (signum, frame))
        #periodic_cbk.stop()
        loop.stop()
    signal.signal(signal.SIGINT, sigint_handler)
    signal.signal(signal.SIGHUP, sigint_handler)
    signal.signal(signal.SIGTERM, sigint_handler)
    #periodic_cbk = tornado.ioloop.PeriodicCallback(ip_poll, poll_interval*60*1000, loop)
    #periodic_cbk.start()
    loop.start()

# vim: set tabstop=4 shiftwidth=4 softtabstop=4 expandtab:
