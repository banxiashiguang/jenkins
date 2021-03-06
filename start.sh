#!/bin/bash
xcodebuild -project Hello.xcodeproj -scheme Hello -sdk iphonesimulator9.3 clean
xcodebuild -project Hello.xcodeproj -scheme Hello -sdk iphonesimulator9.3 > xcodebuild.log
oclint-xcodebuild xcodebuild.log
oclint-json-compilation-database -- -report-type pmd -o oclint.xml
mkdir sonar-reports
mv oclint.xml sonar-reports/
sonar-runner

#删除中间文件
rm -f oclint.xml compile_commands.json
rm -rf sonar-reports/
