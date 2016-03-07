# puppet-amqpbeat

[![Build Status](https://travis-ci.org/stuartbfox/puppet-amqpbeat.svg?branch=master)](https://travis-ci.org/stuartbfox/puppet-amqpbeat)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with amqpbeat](#setup)
    - [What amqpbeat affects](#what-amqpbeat-affects)
    - [Setup requirements](#setup-requirements)
    - [Beginning with amqpbeat](#beginning-with-amqpbeat)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference](#reference)
    - [Public Classes](#public-classes)
    - [Private Classes](#private-classes)
    - [Public Defines](#public-defines)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

The `amqpbeat` module installs and configures the [amqpbeat message shipper](https://github.com/robinpercy/amqpbeat) maintained by [Robin Percy](https://github.com/robinpercy).

## Setup

### What amqpbeat affects

By default `amqpbeat` adds a software repository to your system, and installs amqpbeat along
with required configurations.

### Setup Requirements

The `amqpbeat` module depends on [`puppetlabs/stdlib`](https://forge.puppetlabs.com/puppetlabs/stdlib), and on
[`puppetlabs/apt`](https://forge.puppetlabs.com/puppetlabs/apt) on Debian based systems.

### Beginning with amqpbeat

`amqpbeat` can be installed with `puppet module install stuartbfox-amqpbeat` (or with r10k, librarian-puppet, etc.)

## Usage
