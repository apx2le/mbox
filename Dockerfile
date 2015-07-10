FROM node:0.12-slim

RUN apt-get update \
  && apt-get install -y --fix-missing curl openjdk-7-jdk lib32z1 lib32stdc++6 \
  && apt-get -q -y clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
RUN curl https://install.meteor.com/ | sh
RUN meteor install-sdk android \
  && meteor create try-meteor \
  && cd try-meteor \
  && meteor update \
  && meteor add iron:router \
  && meteor add materialize:materialize \
  && meteor add momentjs:moment \
  && meteor add mquandalle:bower \
  && meteor add useraccounts:materialize \
  && meteor add velocity:html-reporter \
  && rm -rf try-meteor
