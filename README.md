# sonarqube

*Warning:* This module is incomplete and not ready for use.

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with sonarqube](#setup)
    * [What sonarqube affects](#what-sonarqube-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with sonarqube](#beginning-with-sonarqube)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The sonarqube module installs, configures, and manages the SonarQube service.

## Setup

### What sonarqube affects

### Setup Requirements

The Puppet modules required to (optionally) manage the SonarQube database are not specified as hard dependencies of this module. Therefore if you wish to set `manage_db` to true you should ensure that `puppetlabs-mysql` or `puppetlabs-postgresql` is available.

## Usage

## Reference

### Classes

#### Public classes

* `sonarqube`: Installs and configures SonarQube.

#### Private classes

### Parameters

#### sonarqube

## Limitations

## Development

All contributions welcome, particularly with tests attached.
