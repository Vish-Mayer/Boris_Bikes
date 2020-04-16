# Boris Bikes
```
                                                          ~~@ 
 -------- __@      __@       __@       __@      __~@       /\,
 ----- _`\<,_    _`\<,_    _`\<,_     _`\<,_    _`\<,_   -|~(*)
 ---- (*)/ (*)  (*)/ (*)  (*)/ (*)  (*)/ (*)  (*)/ (*)  (*)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

```
___

## Overview

First weeks project at Maker's Academy. A pair programming challenge to build a program that will emulate a bike sharing system.

## How to use

Boris Bikes is written in Ruby and runs directly from the command line. Install by either cloning or forking the repository. Change directory to the root folder and run bundle install.

```
$ bundle install

```

 Open irb, and enter the following to run the application.

```
$ require './lib/dockingstation.rb'
 => true

```

To run the tests for the application, run rspec.

```
$ rspec 
```

## Scope

**Docking Station** (*DockingStation.new*)
- Station has a capacity which can be set by user upon initialization
- Bikes can be docked at a station
- Bikes can be released from a docking station bike when available
- Stations will not release broken bikes
- Broken bikes can be picked up from docking station
- Fixed bikes can be dropped at docking station

**Bike** (*Bike.new*)
- Working object attribute
- Ability to change working attribute
- Can be reported broken by the user 

**Van** (*Van.new*)
- Can collect bikes from location
- Ability to drop bikes at location while specifying whether to drop broken or fixed bikes

**Garage** (*Garage.new*)
- Broken bikes can be dropped at a garage
- Bikes can be garage fixed 
- Fixed bikes can be picked up from garage

## User Requirements 

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.
```
```
As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```
```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station
```
```
As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```
```
As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.
```
```
As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.
```
```
As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.
```
```
As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.
```
```
As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```
