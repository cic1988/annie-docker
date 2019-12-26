# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    annie-docker
# name:     cic1988/annie-docker
# authors:  gaoyuanhot@gmail.com
# ------------------------------------------------------

FROM jrottenberg/ffmpeg:3.2-alpine AS ffmpeg
FROM golang:1.13-alpine

# see: https://github.com/jrottenberg/ffmpeg/issues/99#issuecomment-400154614
COPY --from=ffmpeg / /

WORKDIR /tmp/annie

# install git
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

# install annie
RUN go get github.com/iawia002/annie

ENTRYPOINT ["annie"]


