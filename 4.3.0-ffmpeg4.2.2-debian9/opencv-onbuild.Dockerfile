FROM tangx/ffmpeg-debian:4.2.2-golang1.4.3


ENV GOCV_VERSION v0.23.0
RUN set -eux \
    && export PATH=/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin   \
    && export GO111MODULE=off   \
    && go get -u -d gocv.io/x/gocv \
    && cd $GOPATH/src/gocv.io/x/gocv  \
    && git checkout $GOCV_VERSION   \
    # && /bin/sed -i 's/sudo//' Makefile   \
    && /usr/bin/make install  \
    && export GO111MODULE=on

ENV CGO_ENABLED 1
ENV CGO_CPPFLAGS "-I/usr/local/include"
ENV CGO_LDFLAGS "-L/usr/local/lib -lopencv_core -lopencv_face -lopencv_videoio -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs -lopencv_objdetect -lopencv_features2d -lopencv_video -lopencv_dnn -lopencv_xfeatures2d"


