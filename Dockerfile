# escape=`

# Build off .NET Core nanoserver container
FROM microsoft/windowsservercore:latest

LABEL maintainer="Campbell Gunn <campbelldgunn@gmail.com>" `
      org.label-schema.schema-version="v2.8.0" `
      org.label-schema.name="Windows Helm Client"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV HELM_LATEST_VERSION="v2.8.0" 

RUN Invoke-WebRequest -UseBasicParsing https://chocolatey.org/install.ps1 | Invoke-Expression; `
    choco install -y 7zip.install

RUN Invoke-WebRequest ""http://storage.googleapis.com/kubernetes-helm/helm-$env:HELM_LATEST_VERSION-windows-amd64.tar.gz"" ""-OutFile helm-$env:HELM_LATEST_VERSION-windows-amd64.tar.gz""

RUN 7z x "".\helm-$env:HELM_LATEST_VERSION-windows-amd64.tar.gz;"" `
7z x "".\helm-$env:HELM_LATEST_VERSION-windows-amd64.tar""

RUN mv windows-amd64 '\Program Files\'
RUN rm "".\helm-$env:HELM_LATEST_VERSION-windows-amd64.tar.gz;"" `
rm "".\helm-$env:HELM_LATEST_VERSION-windows-amd64.tar"" 

COPY Set-PathVariable.ps1 .\Set-PathVariable.ps1

RUN .\Set-PathVariable.ps1 -NewLocation 'C:\Program Files\windows-amd64'

ENTRYPOINT powershell 'helm.exe'
# CMD '--help'
