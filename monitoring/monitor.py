
import json
import subprocess
import time
import urllib.error
import urllib.request
from datetime import datetime, timezone

URL = "http://3.87.36.146:8080/"
REGIAO = "us-east-1"
NAMESPACE = "Reencontra/Observabilidade"


def medir_requisicao(url):
    inicio = time.perf_counter()

    try:
        with urllib.request.urlopen(url, timeout=10) as resposta:
            status = resposta.status
            resposta.read()

    except urllib.error.HTTPError as erro:
        status = erro.code

    except (urllib.error.URLError, TimeoutError, OSError) as erro:
        print(f"Falha de conexao: {erro}")
        return None, None

    latencia = (time.perf_counter() - inicio) * 1000
    return status, round(latencia, 2)


def enviar_metricas(status, latencia):
    metricas = [
        {
            "MetricName": "LatenciaHTTP",
            "Value": latencia,
            "Unit": "Milliseconds"
        },
        {
            "MetricName": "RequisicoesHTTP",
            "Value": 1,
            "Unit": "Count"
        },
        {
            "MetricName": "ErrosHTTP4xx",
            "Value": int(400 <= status < 500),
            "Unit": "Count"
        },
        {
            "MetricName": "ErrosHTTP5xx",
            "Value": int(500 <= status < 600),
            "Unit": "Count"
        }
    ]

    comando = [
        "aws", "cloudwatch", "put-metric-data",
        "--region", REGIAO,
        "--namespace", NAMESPACE,
        "--metric-data", json.dumps(metricas)
    ]

    resultado = subprocess.run(
        comando,
        capture_output=True,
        text=True,
        check=False
    )

    if resultado.returncode == 0:
        print("Metricas enviadas ao CloudWatch!")
    else:
        print("Erro ao enviar metricas:")
        print(resultado.stderr)


def main():
    print("=== Monitoramento Reencontra ===")
    print("Horario UTC:", datetime.now(timezone.utc).isoformat())

    status, latencia = medir_requisicao(URL)

    if status is None:
        print("Nao foi possivel medir a requisicao.")
        return

    print(f"Status HTTP: {status}")
    print(f"Latencia: {latencia} ms")

    enviar_metricas(status, latencia)


if __name__ == "__main__":
    main()
