# ib-light-dockerclients
Docker container containing ib_insync, ib_async and the official Interactive Brokers API  

▶️ Run and Mount Current Directory

docker run -it --rm -v "$PWD":/scripts --network=host ib-scripts

    This gives you shell access with all dependencies installed and your local code available at /scripts.

📜 Run a Python Script Inside

From outside:

docker run -it --rm -v "$PWD":/scripts --network=host ib-scripts python /scripts/your_script.py

Or inside the container:

python your_script.py


