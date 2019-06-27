# docker-truedividendcrypto
Wallet and daemon for True Dividend Crypto [TDC] cryptocurrency on docker

# Quickstart
Type `docker run -it -e "USER=someuser" -e "PASSWORD=topsecret" -e "RPCALLOW=127.0.0.1" chainmapper/truedividendcrypto` and see the wallet starting.

Alternatively type `docker run -it -v "<path_to_config>:/config/tdc.conf" chainmapper/truedividendcrypto` to use your own config.

```
Docker TDC wallet

By: ChainMapper
Website: https://chainmapper.com

Starting TDC daemon...
```

# Proper start
Use a volume to store all data. The image stores it's data in `/data`. So mapping that volume will do the trick.

Additionally you can override the config and wallet file using volumes pointing to `/config/tdc.conf` and `/config/wallet.data`

# License
MIT, see LICENSE file