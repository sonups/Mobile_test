#!/usr/bin/env python
import sys
import ruamel.yaml
import os

dir_path = os.path.dirname(os.path.realpath(__file__))
yaml = ruamel.yaml.YAML()
appium_server_ip = os.environ["APPIUM_SERVER_IP"]
# yaml.preserve_quotes = True
#print("1")
with open(dir_path+'/android_capabilities.yml') as fp:
    data = yaml.load(fp)
#print("2")
data[':appium_lib'][':server_url'] = "http://" + appium_server_ip + ":4723/wd/hub"

with open('android_capabilities.yml','w') as fpw:
    documents = yaml.dump(data, fpw)