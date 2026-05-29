# What Really Matters for Table LLMs? A Meta-Evaluation of Model and Data Effects

Companion repository for the EACL 2026 Findings paper.

> **What Really Matters for Table LLMs? A Meta-Evaluation of Model and Data Effects**
> Naihao Deng, Sheng Zhang, Henghui Zhu, Shuaichen Chang, Jiani Zhang, Alexander Hanbo Li, Chung-Wei Hang, Hideo Kobayashi, Yiqun Hu, Patrick Ng
> *Findings of EACL 2026* — [aclanthology.org/2026.findings-eacl.195](https://aclanthology.org/2026.findings-eacl.195/)

We replicate four table LLMs (TableLlama, TableLLM, TableBenchLLM, TableGPT) by
instruction-tuning three 7B foundation models (Mistral-v0.3, OLMo, Phi-3) on
four existing training datasets, yielding 12 models, and evaluate them across
16 table benchmarks plus 5 general-capability benchmarks. Our analysis
disentangles the contributions of base model vs. training data and finds that
**base model choice plays a more dominant role than the training data itself**.

## 📦 Released artefacts

| | Location |
|---|---|
| 📄 Camera-ready PDF | [ACL Anthology](https://aclanthology.org/2026.findings-eacl.195/) |
| 📝 LaTeX source | [`paper/`](paper/) |
| 📚 Training corpora (TableLlama / TableLLM / TableBench / TableGPT, bundled) | [`dnaihao/Table-Instructs`](https://huggingface.co/datasets/dnaihao/Table-Instructs) (HF dataset) |
| 🤗 Replicated models (12 paper + Qwen / Phi-3-mini extras) | [huggingface.co/collections/dnaihao/table-llms](https://huggingface.co/collections/dnaihao/table-llms) |
| 📊 Eval scripts and parsed metrics | [`eval/`](eval/) |
| 💾 Raw model outputs (`generated_predictions.jsonl`) | [`dnaihao/table-sft-eval-predictions`](https://huggingface.co/datasets/dnaihao/table-sft-eval-predictions) (HF dataset) |
| 🌐 Project page | [dnaihao.github.io/table-sft-eacl-2026](https://dnaihao.github.io/table-sft-eacl-2026/) |

## 🗂️ Layout

```
.
├── paper/         LaTeX source for the camera-ready (and arXiv) version
├── eval/          Per-{model,benchmark} eval scripts and metric outputs
├── docs/          Astro source for the project page (deploys to GH Pages)
└── LICENSE        MIT (code). Models follow their base-model licenses.
```

## 📚 Citation

```bibtex
@inproceedings{deng-etal-2026-really,
    title = "What Really Matters for Table {LLM}s? A Meta-Evaluation of Model and Data Effects",
    author = "Deng, Naihao  and
      Zhang, Sheng  and
      Zhu, Henghui  and
      Chang, Shuaichen  and
      Zhang, Jiani  and
      Li, Alexander Hanbo  and
      Hang, Chung-Wei  and
      Kobayashi, Hideo  and
      Hu, Yiqun  and
      Ng, Patrick",
    editor = "Demberg, Vera  and
      Inui, Kentaro  and
      Marquez, Llu{\'i}s",
    booktitle = "Findings of the {A}ssociation for {C}omputational {L}inguistics: {EACL} 2026",
    month = mar,
    year = "2026",
    address = "Rabat, Morocco",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2026.findings-eacl.195/",
    doi = "10.18653/v1/2026.findings-eacl.195",
    pages = "3755--3782",
    ISBN = "979-8-89176-386-9"
}
```

## ⚖️ License

The code in this repository is released under the [MIT License](LICENSE).
Released model weights follow the licenses of their respective base models:
Apache-2.0 for Mistral-v0.3, OLMo, Qwen2.5/Qwen3; MIT for Phi-3.
