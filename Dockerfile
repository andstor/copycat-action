FROM node:10.14.1-alpine

LABEL "com.github.actions.name"="Copycat"
LABEL "com.github.actions.description"="Copy files to other repositories"
LABEL "com.github.actions.icon"="copy"
LABEL "com.github.actions.color"="red"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
