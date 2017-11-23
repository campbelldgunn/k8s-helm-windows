# escape=`

# Build off .NET Core nanoserver container
# FROM microsoft/nanoserver:latest
FROM microsoft/windowsservercore:latest

LABEL maintainer="Campbell Gunn <campbelldgunn@gmail.com>" `
      org.label-schema.schema-version="1.0.0" `
      org.label-schema.name="Windows Helm Client"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV HELM_LATEST_VERSION="v2.7.2" `
HELM_PATH="C:\Program Files\windows-amd64"

RUN Invoke-WebRequest -UseBasicParsing https://chocolatey.org/install.ps1 | Invoke-Expression; `
    choco install -y 7zip.install

# RUN wget http://storage.googleapis.com/kubernetes-helm/helm-${HELM_LATEST_VERSION}-windows-amd64.tar.gz
RUN Invoke-WebRequest http://storage.googleapis.com/kubernetes-helm/helm-v2.7.2-windows-amd64.tar.gz -OutFile helm-v2.7.2-windows-amd64.tar.gz 

RUN 7z x .\helm-v2.7.2-windows-amd64.tar.gz; `
7z x .\helm-v2.7.2-windows-amd64.tar

RUN mv windows-amd64 '\Program Files\'

RUN $env:PATH = $env:PATH + ';' + $HELM_PATH

RUN rm .\helm-v2.7.2-windows-amd64.tar.gz; `
rm .\helm-v2.7.2-windows-amd64.tar 

# ENTRYPOINT ["helm"]
# CMD ["help"]
