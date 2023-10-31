FROM ubuntu:20.04
ENV ASPNETCORE_URLS=http://+:80 DOTNET_RUNNING_IN_CONTAINER=true
RUN apt update 
RUN apt -y install gnupg2 wget curl 
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6A030B21BA07F4FB 
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B57C5C2836F4BEB 
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FEEA9169307EA071 
RUN wget -qO - https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/Release.key | apt-key add - 
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - 
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list 
RUN apt-get update && apt-get install -y postgresql-client-12
