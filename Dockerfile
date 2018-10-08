FROM ubuntu:18.04
LABEL maintainer="wizard of z/OS <wizard@zdevops.com>"
USER root
# Setup the system to compile the stuff we need...
RUN apt update
RUN apt install -y libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev git
# Get the repo
RUN git clone https://github.com/fireice-uk/xmr-stak.git
RUN mkdir xmr-stak/build
# Let's make sure we have zero donations to errornous addresses...
COPY config/donate-level.hpp /xmkr-stak/xmrstak/.
# Build the thing
RUN cd /xmr-stak/build && cmake -DCMAKE_BUILD_TYPE=Release -DMICROHTTPD_ENABLE=ON -DOpenCL_ENABLE=OFF -DCUDA_ENABLE=OFF .. && make
RUN cd /xmr-stak/build && ls -lart bin/
RUN cd /xmr-stak/build && cp bin/xmr-stak /bin
COPY config/*.txt /
COPY config/startup.sh /startup.sh
RUN chmod +x /startup.sh
# Future
#EXPOSE 11235
# Let's run it..
ENTRYPOINT ["/startup.sh"]
