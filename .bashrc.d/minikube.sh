#!/bin/bash
if command -v minikube &> /dev/null ; then
  alias kubectl='minikube kubectl --'
fi
