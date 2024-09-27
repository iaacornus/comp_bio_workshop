from random import choice


def gen_seq(k: int) -> str:
    NUC: list[str] = ["A", "T", "G", "C"]

    return (
        "".join(
            [
                nuc_
                    for _ in range(k)
                    for nuc_ in choice(NUC)
            ]
        )
    )


def transcript(seq: str) -> str | bool:
    if "U" in seq:
        return False

    return (
        seq
            .replace("A", "u")
            .replace("G", "c")
            .replace("C", "g")
            .replace("T", "a")
    ).upper()


def translate(seq_: str) -> tuple[str, str]:
    CODON: dict[str, list[str]] = {
            "TCA": ["S", "Ser"],
            "TCC": ["S", "Ser"],
            "TCG": ["S", "Ser"],
            "TCT": ["S", "Ser"],
            "TTC": ["F", "Phe"],
            "TTT": ["F", "Phe"],
            "TTA": ["L", "Leu"],
            "TTG": ["L", "Leu"],
            "TAC": ["Y", "Tyr"],
            "TAT": ["Y", "Tyr"],
            "TAA": ["*", "Stop"],
            "TAG": ["*", "Stop"],
            "TGC": ["C", "Cys"],
            "TGT": ["C", "Cys"],
            "TGA": ["*", "Stop"],
            "TGG": ["W", "Trp"],
            "CTA": ["L", "Leu"],
            "CTC": ["L", "Leu"],
            "CTG": ["L", "Leu"],
            "CTT": ["L", "Leu"],
            "CCA": ["P", "Pro"],
            "CCC": ["P", "Pro"],
            "CCG": ["P", "Pro"],
            "CCT": ["P", "Pro"],
            "CAC": ["H", "His"],
            "CAT": ["H", "His"],
            "CAA": ["Q", "Glu"],
            "CAG": ["Q", "Glu"],
            "CGA": ["R", "Arg"],
            "CGC": ["R", "Arg"],
            "CGG": ["R", "Arg"],
            "CGT": ["R", "Arg"],
            "ATA": ["I", "Ile"],
            "ATC": ["I", "Ile"],
            "ATT": ["I", "Ile"],
            "ATG": ["M", "Met"],
            "ACA": ["T", "Thr"],
            "ACC": ["T", "Thr"],
            "ACG": ["T", "Thr"],
            "ACT": ["T", "Thr"],
            "AAC": ["N", "Asp"],
            "AAT": ["N", "Asp"],
            "AAA": ["K", "Lys"],
            "AAG": ["K", "Lys"],
            "AGC": ["S", "Ser"],
            "AGT": ["S", "Ser"],
            "AGA": ["R", "Arg"],
            "AGG": ["R", "Arg"],
            "GTA": ["V", "Val"],
            "GTC": ["V", "Val"],
            "GTG": ["V", "Val"],
            "GTT": ["V", "Val"],
            "GCA": ["A", "Ala"],
            "GCC": ["A", "Ala"],
            "GCG": ["A", "Ala"],
            "GCT": ["A", "Ala"],
            "GAC": ["D", "Glu"],
            "GAT": ["D", "Glu"],
            "GAA": ["E", "Glu"],
            "GAG": ["E", "Glu"],
            "GGA": ["G", "Gly"],
            "GGC": ["G", "Gly"],
            "GGG": ["G", "Gly"],
            "GGT": ["G", "Gly"],
        }
    seq: str = seq_.upper().strip()

    trans_ol: str = ""
    trans_tl: str = ""
    for i in range(0, len(seq)+1):
        if len(cod_ := seq[i:i+3]) != 3:
            break

        if cod_ in CODON.keys():
            trans_ol += (CODON.get(cod_, "="))[0]
            trans_tl += (CODON.get(cod_, "="))[1]

    return (trans_ol, trans_tl)

