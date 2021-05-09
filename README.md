# certbot-desec

A modified image of the official [certbot/certbot] image that allows to use `certbot` with the [deSEC hook](https://desec.readthedocs.io/en/latest/dyndns/lets-encrypt.html).

The image takes care of setting up the deSEC hook for you.
All you need to do is specify your deSEC token and domain name via the `DEDYN_TOKEN` and `DEDYN_NAME` build arguments, e.g.:
```console
$ docker build . -t certbot-desec --build-arg DEDYN_TOKEN=d41d8cd98f00b204e9800998ecf8427e --build-arg DEDYN_NAME=example.dedyn.io
```

Then you can use this image as you would use the default [certbot/certbot] image to obtain your certificate, e.g.:
```console
$ docker run -it --rm certbot-desec --manual --preferred-challenges dns -d "example.dedyn.io" certonly
```

If you want to use this image fully headless you need to add the `-n`, `--agree-tos` and `--email='your-email@example.com` options.

To renew your certificate use
```console
$ docker run --rm certbot-desec renew
```

[certbot/certbot]: https://hub.docker.com/r/certbot/certbot
