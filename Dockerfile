FROM alpine:3.10

LABEL repository="https://github.com/andstor/copycat-action"
LABEL homepage="https://github.com/andstor/copycat-action"
LABEL "maintainer"="André Storhaug <andr3.storhaug@gmail.com.com>"

LABEL "com.github.actions.name"="Copycat Action"
LABEL "com.github.actions.description"="Copy files to other repositories"
LABEL "com.github.actions.icon"="copy"
LABEL "com.github.actions.color"="red"

RUN apk add --no-cache git

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
