FROM ubuntu:latest

# Install dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install build-essential libreadline-dev zlib1g-dev flex bison postgresql-client -y

# Copy source code
RUN mkdir /code
WORKDIR /code
ADD postgres /code/

# Build postgres
RUN ./configure
RUN make
RUN make install
RUN adduser postgres
RUN mkdir /usr/local/pgsql/data
RUN chown postgres /usr/local/pgsql/data

# Init database
USER postgres
RUN /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data
ENV PGHOST /tmp

# Run server
CMD ["/usr/local/pgsql/bin/postgres", "-D", "/usr/local/pgsql/data"]
