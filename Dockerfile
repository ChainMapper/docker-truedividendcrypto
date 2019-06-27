FROM chainmapper/walletbase-xenial-build as builder

ENV GIT_COIN_URL    https://github.com/truedividendcryptocurrency/truecrypto-oss.git
ENV GIT_COIN_NAME   tdc   

RUN	git clone $GIT_COIN_URL $GIT_COIN_NAME \
	&& cd $GIT_COIN_NAME \
	&& git checkout tags/v1.0.3 \
	&& chmod +x autogen.sh \
	&& chmod +x share/genbuild.sh \
	&& chmod +x src/leveldb/build_detect_platform \
	&& ./autogen.sh && ./configure \
	&& make \
	&& make install

FROM chainmapper/walletbase-xenial as runtime

COPY --from=builder /usr/local/bin /usr/local/bin

RUN mkdir /data
ENV HOME /data

#zmq port, rpc port & main port
EXPOSE 5555 6666 17281

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
COPY wallet.sh /wallet.sh
RUN chmod 777 /*.sh
CMD /start.sh tdc.conf TDC tdcd