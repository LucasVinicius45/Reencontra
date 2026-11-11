from ultralytics import YOLO
import argparse

def main():
    parser = argparse.ArgumentParser(
        description="Detector de cartazes - Reencontra"
    )

    parser.add_argument(
        "--imagem",
        required=True,
        help="Caminho da imagem para análise"
    )

    parser.add_argument(
        "--modelo",
        default="reencontra_yolo_v3.pt",
        help="Caminho do modelo treinado"
    )

    args = parser.parse_args()

    modelo = YOLO(args.modelo)

    resultados = modelo.predict(
        source=args.imagem,
        conf=0.25,
        save=True
    )

    for resultado in resultados:
        print(
            "Cartazes detectados:",
            len(resultado.boxes)
        )

        for caixa in resultado.boxes:
            print(
                "Confiança:",
                f"{float(caixa.conf[0]):.2%}"
            )

if __name__ == "__main__":
    main()
