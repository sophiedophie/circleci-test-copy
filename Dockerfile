# syntax=docker/dockerfile:experimental
FROM alpine
RUN --mount=type=secret,id=mysite.key,required cat /run/secrets/mysite.key