#!/usr/bin/env python3
import requests

session = requests.Session()
session.post('http://localhost:8000/login', json={
  'username': 'ubuntu',
  'password': 'linux',
  'eauth': 'pam',
})

resp = session.post('http://localhost:8000', json=[{
  'client': 'local',
  'tgt': '*',
  'fun': 'test.ping',
}])

print(resp.json())
