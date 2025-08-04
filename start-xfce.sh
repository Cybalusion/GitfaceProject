#!/bin/bash

export DISPLAY=:1

echo "[INFO] Starting Xvfb virtual display..."
Xvfb :1 -screen 0 1024x768x16 &

sleep 2

echo "[INFO] Launching XFCE4 desktop environment..."
startxfce4 &

sleep 5

echo "[INFO] Starting VNC server..."
x11vnc -display :1 -nopw -forever -shared &

echo "[INFO] Launching noVNC web viewer on port 6080..."
websockify --web=/usr/share/novnc/ 6080 localhost:5900
