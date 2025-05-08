```markdown
# 🐍 IB Light Docker Client

A lightweight Dockerized environment for running Python scripts that interact with [Interactive Brokers](https://www.interactivebrokers.com/) via:

- ✅ [`ib_insync`](https://github.com/erdewit/ib_insync)
- ✅ [`ib_async`](https://github.com/jmduarte/ib-async)
- ✅ [`ipapi`](https://github.com/ipapi-co/ipapi-python)
- ✅ Official [`IBAPI`](https://interactivebrokers.github.io/) (installed from IBKR zip)

This is ideal for algo trading, automation, or testing IB API scripts in a clean and portable setup.

---

## 🛠️ Features

- Minimal image built from `python:3.11-slim`
- Installs IBAPI manually from IBKR's archive (no longer on PyPI)
- Mounts your local scripts directory for easy iteration
- Uses host networking for full compatibility with a separate IB Gateway container
- Supports both interactive shell and script execution

---

## 📦 Project Structure

```
.
├── Dockerfile             # Builds the ib-scripts image
├── docker-compose.yml     # Compose file for local dev
├── requirements.txt       # Python dependencies
├── README.md              # This file
└── my_script.py           # Your IB API script
```

---

## 🐳 Manual Docker Usage

### Build the image

```bash
docker build -t ib-scripts .
```

### Run the container interactively

```bash
docker run -it --rm \
  --network=host \
  -v "$PWD":/scripts \
  -w /scripts \
  ib-scripts
```

You will be dropped into an interactive shell inside the container with your scripts available at `/scripts`.

### Run a Python script

```bash
docker run -it --rm \
  --network=host \
  -v "$PWD":/scripts \
  -w /scripts \
  ib-scripts python my_script.py
```

---

## ⚙️ Docker Compose Usage

### Run an interactive shell

```bash
docker-compose run ib-scripts
```

### Run a specific Python script

```bash
docker-compose run ib-scripts python my_script.py
```

### Clean up orphan containers

```bash
docker compose down --remove-orphans
```

---

## 🌐 IB Gateway Compatibility

Ensure your Interactive Brokers Gateway is:

- Running on the host (or accessible via `localhost`)
- Listening on port `4002` (default)

If using Docker for IBGW, make sure it uses `network_mode: host` (or expose the port properly and adjust connection IP in scripts).

---

## 📥 requirements.txt Example

```text
ib_insync
ib_async
ipapi
```

---

## 🧠 Tips

- This setup is meant for **testing and development**, but can be extended for production and orchestration.
- You can run multiple scripts from the same mounted directory, with full control over Python environment isolation.
- The image size remains slim while supporting the full IB API.

---

## 📜 License

MIT

---

## 🙋 Support

Contributions welcome! Open issues for bugs or ideas.
```

