#!/usr/bin/env sh

# Manual IPSec

## Clean all previous IPsec stuff

ip xfrm policy flush
ip xfrm state flush

# DIRECTION: TRAFFIC COMING FROM HOMEROUTER AND HOME NETWORK TO COMPANYROUTER

## The SA vars for the first tunnel

SPI7=0x007
ENCKEY7=0xFEDCBA9876543210FEDCBA9876543210

## Activate the tunnel from homerouter to companyrouter

### Define the SA (Security Association)

ip xfrm state add \
    src 192.168.62.42 \
    dst 192.168.62.253 \
    proto esp \
    spi ${SPI7} \
    mode tunnel \
    enc aes ${ENCKEY7}

### Set up the SP using this SA

ip xfrm policy add \
    src 172.10.10.0/24 \
    dst 172.30.0.0/16 \
    dir out \
    tmpl \
    src 192.168.62.42 \
    dst 192.168.62.253 \
    proto esp \
    spi ${SPI7} \
    mode tunnel

# DIRECTION: TRAFFIC COMING FROM COMPANYROUTER TO HOMEROUTER AND HOME NETWORK

## The SA vars for the second tunnel

SPI7=0x007
ENCKEY7=0x97daa6cd1f861fbae4379b208552bc6a5e058583909de014

### Define the SA (Security Association)

ip xfrm state add \
    src 192.168.62.253 \
    dst 192.168.62.42 \
    proto esp \
    spi ${SPI7} \
    mode tunnel \
    enc aes ${ENCKEY7}

### Set up the SP using this SA

ip xfrm policy add \
    src 172.30.0.0/16 \
    dst 172.10.10.0/24 \
    dir in \
    tmpl \
    src 192.168.62.253 \
    dst 192.168.62.42 \
    proto esp \
    spi ${SPI7} \
    mode tunnel

ip xfrm policy add \
    src 172.30.0.0/16 \
    dst 172.10.10.0/24 \
    dir fwd \
    tmpl \
    src 192.168.62.253 \
    dst 192.168.62.42 \
    proto esp \
    spi ${SPI7} \
    mode tunnel
