#!/bin/bash
cp /usr/src/app/features/support/properties/capabilities/android_capabilities.yml android_capabilities.yml
/usr/bin/python set_server_url.py
cp android_capabilities.yml /usr/src/app/features/support/properties/capabilities/android_capabilities.yml