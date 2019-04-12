#!/bin/sh

#  universal-framework.sh
#  SocialSDKs_Swift
#
#  Created by wuweixin on 2019/4/12.
#  Copyright © 2019 wuweixin. All rights reserved.

if [ "${ACTION}" = "build" ]
then

INSTALL_DIR=${SRCROOT}/Products/${TARGET_NAME}.framework
DEVICE_DIR=${BUILD_ROOT}/${CONFIGURATION}-iphoneos/${TARGET_NAME}.framework
SIMULATOR_DIR=${BUILD_ROOT}/${CONFIGURATION}-iphonesimulator/${TARGET_NAME}.framework
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi
mkdir -p "${INSTALL_DIR}"

cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"
lipo -create "${DEVICE_DIR}/${TARGET_NAME}" "${SIMULATOR_DIR}/${TARGET_NAME}" -output "${INSTALL_DIR}/${TARGET_NAME}"
open "${SRCROOT}/Products"
fi
