import os

from mastermind.proxyswitch import enable, disable
from mastermind import handlers, driver
from mastermind.say import logger

def request(context, flow):
    handlers.request(context, flow)

def response(context, flow):
    handlers.response(context, flow)

def start(context, argv):
    context.source_dir = argv[1]
    context.proxy_settings = argv[2] == "True"
    context.port = argv[3]
    context.host = argv[4]
    context.storage_dir = argv[5]

    driver.register(context)

    if context.proxy_settings:
        enable(context.host, context.port)

    context.log('Source dir: {}'.format(context.source_dir))

def done(context):
    try:
        if context.proxy_settings:
            disable()
    except TypeError:
        logger.error("mitmproxy has crashed")
