<template>
  <div class="model-page">
    <h2>
      <span class="breadcrumb-link" @click="goBack">Model/</span>
      {{ model.name }} (v{{ model.version }})
    </h2>

    <!-- 上半部分：左右结构 -->

    <div class="section-block">
      <h3>Overview</h3>
      <p>{{ model.overview }}</p>
    </div>
    <el-row :gutter="20">
      <!-- Metadata Section -->
      <el-col :span="12">
        <div class="section-block">
          <h3>Metadata</h3>
          <el-row :gutter="10" class="metadata-grid">
            <el-col :span="12" v-for="(value, key) in model.metadata" :key="key">
              <div class="meta-item">
                <span class="meta-key">{{ key }}:</span>
                <span class="meta-value">{{ value }}</span>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>

      <!-- Examples Section -->
      <el-col :span="12">
        <div class="section-block">
          <el-tabs v-model="activeLang" type="card">
            <el-tab-pane v-for="(blocks, lang) in model.examples" :key="lang" :label="lang" :name="lang">
              <CodeBlock v-for="(block, idx) in blocks" :key="lang + '-' + idx" :title="block.title"
                :code="block.code" />
            </el-tab-pane>
          </el-tabs>
        </div>
      </el-col>
    </el-row>



    <!-- Schema 区块 -->
    <div class="section-block">
      <h3>Schema</h3>
      <el-row :gutter="20">
        <el-col :span="24">
          <el-card class="schema-card">
            <el-row :gutter="20">
              <el-col :span="12">
                <h4>Inputs</h4>
                <ul>
                  <li v-for="(input, idx) in model.inputs" :key="'input-' + idx">
                    <strong>Name:</strong> <code>{{ input.name }}</code><br />
                    <strong>Shape:</strong> <code>{{ input.shape }}</code><br />
                    <strong>Doc:</strong> {{ input.doc }}
                  </li>
                </ul>
              </el-col>
              <el-col :span="12">
                <h4>Targets</h4>
                <ul>
                  <li v-for="(target, idx) in model.targets" :key="'target-' + idx">
                    <strong>Name:</strong> <code>{{ target.name }}</code><br />
                    <strong>Shape:</strong> <code>{{ target.shape }}</code><br />
                    <strong>Doc:</strong> {{ target.doc }}
                  </li>
                </ul>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </div>

    <!-- Dataloader 区块 -->
    <div class="section-block">
      <h3>Dataloader</h3>
      <el-row :gutter="20">
        <el-col :span="24">
          <el-card class="dataloader-card">
            <el-row :gutter="20">
              <el-col :span="12">
                <h4>General Info</h4>
                <strong>Defined as:</strong>
                {{ model.dataloader.definedAs }}<br />
                <strong>Doc:</strong>
                {{ model.dataloader.doc }}<br />

                <strong>Authors:</strong>
                {{ model.dataloader.authors }}<br />

                <strong>Type:</strong>
                {{ model.dataloader.type }}<br />

                <strong>License:</strong>
                {{ model.dataloader.license }}
              </el-col>
              <el-col :span="12">
                <h4>Arguments</h4>
                <ul>
                  <li v-for="(arg, idx) in model.dataloader.arguments" :key="'arg-' + idx">
                    <strong>{{ arg.name }}</strong> — {{ arg.doc }}
                    <span v-if="arg.optional"> (optional)</span>
                  </li>
                </ul>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </div>




    <!-- Navigation Button -->
    <div class="navigation-section">
      <el-button 
        type="primary" 
        size="large"
        @click="goBack" 
        class="back-button"
      >
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="back-icon">
          <path d="M19 12H5M12 19l-7-7 7-7"/>
        </svg>
        Back to Model List
      </el-button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import CodeBlock from '../components/CodeBlock.vue'

const activeLang = ref('Python')

const route = useRoute()
const router = useRouter()

type ModelId = 'epcot' | 'epcot-v2'
type SchemaField = {
  name: string
  shape: string
  doc: string
}
type DataloaderConfig = {
  definedAs: string
  doc: string
  authors: string
  type: string
  license: string
  arguments: {
    name: string
    doc: string
    optional?: boolean
  }[]
}
type ExampleBlock = {
  title: string
  code: string
}
type MultiLangExamples = {
  [lang: string]: ExampleBlock[]
}


const modelDataMap: Record<ModelId, {
  name: string
  version: string
  overview: string
  metadata: Record<string, string>

  inputs: SchemaField[]
  targets: SchemaField[]
  dataloader: DataloaderConfig
  examples: MultiLangExamples
}> = {
  epcot: {
    name: 'EPCOT',
    version: '1.0',
    overview: `EPCOT (EPigenome, Chromatin Organization, and Transcription) is a deep learning framework designed to comprehensively predict multiple genomic modalities. It uses only cell-type specific chromatin accessibility profiles (e.g., DNase-seq or ATAC-seq) and the reference DNA sequence as input. The framework employs a two-stage training strategy: a pre-training phase for Epigenomic Feature Prediction (EFP) on 245 features, followed by fine-tuning on downstream tasks including Gene Expression Prediction (GEP), Chromatin Organization Prediction (COP), and Enhancer Activity Prediction (EAP). EPCOT leverages a unique encoder–decoder architecture to capture relationships between modalities and achieves high accuracy in cross-cell and cross-species predictions, making it a powerful tool for mapping regulatory landscapes in new cell types.
`,
    metadata: {
      Authors: 'Zhenhao Zhang, Fan Feng, Yiyang Qiu, Jie Liu',
      License: 'CC-BY-NC 4.0',
      'Contributed by': 'Jie Liu Lab',
      'Cite as': 'https://doi.org/10.1093/nar/gkad436',
      Type: 'Pretraining + Fine-tuning deep learning framework',
      Postprocessing: 'arcsinh-transformation for signal prediction; attention pooling',
      'Trained on': 'Human DNA sequences and chromatin accessibility data (DNase-seq) across multiple cell types, with labels from 245 epigenomic features, CAGE-seq, RNA-seq, Hi-C, Micro-C, and STARR-seq',
      'Source files': 'https://github.com/liu-bioinfo-lab/EPCOT'
    },

    inputs: [
      { name: 'dna_seq', shape: '(1600, 4)', doc: 'One-hot encoded 1.6kb DNA sequence' },
      { name: 'chrom_acc', shape: '(1600,)', doc: 'ATAC-seq/DNase-seq chromatin accessibility signal' }
    ],
    targets: [
      { name: 'epigenomic_features', shape: '(245,)', doc: 'Binary or signal prediction of TFs and histone marks' },
      { name: 'gene_expression', shape: '(1,)', doc: 'Gene expression score (RNA-seq/CAGE-seq)' },
      { name: 'contact_map', shape: '(192, 192)', doc: 'Hi-C / Micro-C contact matrix' },
      { name: 'enhancer_activity', shape: '(1,)', doc: 'STARR-seq enhancer activity score' }
    ],
    dataloader: {
      definedAs: './dataloader.py',
      doc: `Loads DNA sequence and chromatin accessibility signals (e.g., DNase-seq/ATAC-seq), extracts genomic regions, and prepares multi-modal input batches for epigenomic feature prediction, gene expression, chromatin contact maps, and enhancer activity tasks.`,
      authors: 'Jie Liu, Zhenhao Zhang, Fan Feng, Yiyang Qiu',
      type: 'MultiModalBatchIterator',
      license: 'CC-BY-NC 4.0',
      arguments: [
        { name: 'fasta_file', doc: 'Reference genome FASTA file' },
        { name: 'accessibility_file', doc: 'ATAC/DNase-seq bigWig or npz file' },
        { name: 'region_file', doc: 'BED file of genomic regions' },
        { name: 'batch_size', doc: 'Number of samples per batch' },
        { name: 'sequence_length', doc: 'Window length in bp (default: 1600)' },
        { name: 'output_modality', doc: 'Task type: EFP, GEP, COP, or EAP' }
      ]
    },
    examples: {
      Python: [
        {
          title: "Run EPCOT locally (setup + prediction)",
          code: `# Clone repo and install dependencies
git clone https://github.com/zzh24zzh/EPCOT_gradio.git
cd EPCOT_gradio/
pip install -r requirements.txt

# Download pre-trained models and reference genome
python download.py

# Process ATAC-seq .bam to .pickle (recommended ~30M reads)
python atac_process.py -b your.bam -p 12

# Launch the Gradio demo
python gradio_epcot.py`
        },
        {
          title: "Load EPCOT model and make predictions (Python script)",
          code: `from epcot.model import EPCOTModel

model = EPCOTModel.load_pretrained("outputs/pretrain/model.ckpt")
pred = model.predict({
    "fasta": "data/hg38.fa",
    "accessibility": "data/DNase-seq.bigWig",
    "regions": "data/gep_regions.bed"
})
print(pred.head())`
        }
      ],
      Colab: [
        {
          title: "Install dependencies (Colab)",
          code: `!pip install gradio==3.24.1 gdown einops pyBigWig==0.3.17 deepTools==3.5.1
!wget https://github.com/samtools/samtools/releases/download/1.17/samtools-1.17.tar.bz2
!bunzip2 samtools-1.17.tar.bz2
!tar -xf samtools-1.17.tar
!apt-get install -q samtools`
        },
        {
          title: "Clone the EPCOT Gradio repository and download models",
          code: `!git clone https://github.com/zzh24zzh/EPCOT_gradio.git
%cd EPCOT_gradio/
!python download.py`
        },
        {
          title: "Mount Google Drive and process ATAC-seq BAM file",
          code: `from google.colab import drive
drive.mount('/content/gdrive')`
        },
        {
          title: "Run ATAC processing script",
          code: `!python atac_process.py -b /content/gdrive/MyDrive/GM12878.bam -p 12

# Output: ATAC/GM12878.pickle`
        },
        {
          title: "Launch Gradio Demo (Run Model + Visualize Results)",
          code: `import gradio as gr
from func_gradio import predict_func_for_colab, make_plots

# Define app1 (Run Model)
app1 = gr.Interface(fn=predict_func_for_colab, inputs=[...], outputs=[...], title="Run Model")

# Define app2 (Visualize Prediction Results)
app2 = gr.Interface(fn=make_plots, inputs=[...], outputs=[...])

# Launch tabbed interface
demo = gr.TabbedInterface([app1, app2], ["Run Model", "Visualize Prediction Results"])
demo.launch(share=True)`
        }
      ]
    }
    ,


  },
  'epcot-v2': {
    name: 'EPCOTv2',
    version: '2.0',
    overview: 'EPCOTv2 is a general artificial intelligence model designed to create a unified and comprehensive understanding of the genome by integrating a wide array of genomic, epigenomic, and transcriptomic data. Operating within a multi-task deep learning architecture, the model uses fundamental inputs—a 600kb DNA sequence and cell-type-specific chromatin accessibility (ATAC-seq)—to predict a diverse set of molecular modalities for the central 500kb region. A key strength of EPCOTv2 is its generalizability, demonstrating strong performance across different cell types and tissues, even those not seen during training. The model excels at predicting challenging and costly-to-measure modalities, such as nascent RNA transcription (including enhancer RNAs) and ultra-high-resolution 3D chromatin organization maps like Micro-C. This predictive power allows it to serve as a powerful computational tool for imputing data where direct experimental profiling is impractical. Furthermore, the framework has been successfully adapted from a human model to create the first general predictive model for diverse mouse genomic data, highlighting its utility in comparative studies. By accurately capturing the functions of non-coding genetic variants and regulatory elements, EPCOTv2 provides a robust platform for dissecting complex gene regulation in both health and disease.',
    metadata: {
      Authors: 'Zhenhao Zhang, Xinyu Bao, Linghua Jiang, Xin Luo, Yichun Wang, Annelise Comai, Joerg Waldhaus, Anders S. Hansen, Wenbo Li, and Jie Liu',
      License: 'CC-BY 4.0 International license',
      'Contributed by': 'Jie Liu Lab, University of Michigan',
      'Cite as': 'https://doi.org/10.1101/2025.05.08.652986',
      Type: 'Multi-task deep learning framework utilizing convolutional layers, Bi-LSTMs, and transformer encoders with a shared local and global encoder architecture and task-specific prediction heads. Employs supervised training with a curriculum learning strategy.',
      Postprocessing: 'RPGC normalization followed by division by the 95th percentile and an arcsinh transformation for expression data. Log2 transformation, clipping, and Gaussian smoothing for chromatin contact maps. Multi-head global attention pooling on local encoder features.',
      'Trained on': 'Human model: DNA sequences and ATAC-seq data from a diverse set of cell lines and tissues. Labels include over 1,000 TF and 11 histone ChIP-seq profiles, mRNA assays (CAGE-seq, RNA-seq), nascent RNA assays (GRO-seq, Bru-seq, TT-seq, etc.), and high-resolution 3D chromatin contact maps (Intact Hi-C, Micro-C). Mouse model: Adapted from the human model and fine-tuned on mouse experimental data including ChIP-seq, RNA-seq, CAGE-seq, PRO-seq, GRO-seq, Hi-C, Micro-C, and region capture Micro-C (RCMC).',
      'Source files': 'https://github.com/liu-bioinfo-lab/general_AI_model'
    },
    inputs: [
      {
        name: 'atac_signal.pickle',
        shape: 'N/A',
        doc: 'The required input format for the prediction script, generated from a BAM file via a two-step preprocessing pipeline (bamCoverage -> atac_process.py). It contains the ATAC-seq signal for the genomic regions to be predicted.'
      }
    ],
    targets: [
      {
        name: 'ChIP-seq',
        shape: '(600, num_features)',
        doc: 'Binding profiles for over 1,000 transcription factors and 11 common histone marks at 1kb resolution.'
      },
      {
        name: 'RNA expression',
        shape: '(600, num_assays)',
        doc: 'Predicts mRNA assays (CAGE-seq, RNA-seq) and nascent RNA assays (GRO-seq, Bru-seq, TT-seq, NET-CAGE, etc.) at 1kb resolution.'
      },
      {
        name: 'Chromatin contact maps',
        shape: '(120, 120, num_maps)',
        doc: 'Predicts high-resolution 3D chromatin organization from ChIA-PET (5kb resolution), Intact Hi-C, and Micro-C (1kb resolution).'
      }
    ],
    dataloader: {
      definedAs: 'A two-step command-line process. First, `bamCoverage` converts a BAM file to a bigWig file. Second, `atac_process.py` converts the bigWig file into the required `.pickle` input format.',
      doc: 'This pre-processing pipeline prepares ATAC-seq data for prediction. The human genome is divided into 11,123 600kb regions specified in `input_region_600kb.bed`. The mouse regions are in `input_region_mm10.bed`. The model predicts on the central 500kb of these regions.',
      authors: 'Zhenhao Zhang, Xinyu Bao, Linghua Jiang, Xin Luo, Yichun Wang, Annelise Comai, Joerg Waldhaus, Anders S. Hansen, Wenbo Li, and Jie Liu',
      type: 'Command-line pre-processing pipeline',
      license: 'CC-BY 4.0 International license',
      arguments: [
        { name: 'input.bam', doc: 'Input BAM file for `bamCoverage`.' },
        { name: 'black_list.bed', doc: 'File containing regions to exclude.' },
        { name: '${cell_line}_atac.bigWig', doc: 'The bigWig file used as input for `atac_process.py`.' }
      ]
    },
    examples: {
      Python: [
        {
          title: 'Human Data: Input Preparation & Prediction',
          code: `# 1. Generate the .bigWig file from your BAM file
bamCoverage --bam input.bam -o \${cell_line}_atac.bigWig \\
  --outFileFormat bigwig --normalizeUsing RPGC \\
  --effectiveGenomeSize 2913022398 --Offset 1 \\
  --binSize 10 --numberOfProcessors 12 \\
  --blackListFileName ../data/black_list.bed

# 2. Generate the .pickle file required for prediction
python atac_process.py \${cell_line}_atac.bigWig

# 3. Run prediction
# (Modify "pred_modalities" in tt_pred_gw.py to select outputs)
python tt_pred_gw.py`
        },
        {
          title: 'Human Data: Extracting Predictions',
          code: `import pickle

# Assume the output file is called ‘spleen.pickle’
with open('spleen.pickle', 'rb') as file:
    spleen_pickle = pickle.load(file)

# Access predictions for different modalities by key
# Each predicted sample is the central 500kb from a 600kb segment
# Shape format: (num_regions, bins, features)

print(spleen_pickle['rna'].shape) 
# expected shape: (11123, 500, 3)

print(spleen_pickle['microc'].shape)
# expected shape: (11123, 500, 500, 2)

print(spleen_pickle['hic'].shape)
# Hi-C is predicted at 5kb resolution
# expected shape: (11123, 100, 100, 3)`
        },
        {
          title: 'Mouse Data: Prediction Workflow',
          code: `# The process is similar to human data prediction
# Use mouse-specific blacklist and genome files.
# The prediction script for mouse is pred_gw.py

# 1. Generate bigWig
# (Use appropriate --effectiveGenomeSize for mm10)
bamCoverage --bam mouse_input.bam -o \${cell_line}_atac.bigWig ...

# 2. Generate pickle file
python atac_process.py \${cell_line}_atac.bigWig

# 3. Run prediction
python pred_gw.py`
        },
        {
          title: 'Mouse Data: Extracting Predictions',
          code: `import pickle

# Assume the output file is called ‘mouse.pickle’
with open('mouse.pickle', 'rb') as file:
    mouse_pickle = pickle.load(file)

# Access mouse-specific modalities
# 'n' is the number of input regions
print(mouse_pickle['epi'].shape)
# expected shape: (n, 500, 51)

print(mouse_pickle['rcmc'].shape)
# expected shape: (n, 500, 500, 1)`
        }
      ],
      Colab: [
  {
    title: "Install Dependencies",
    code: `# Install specific torch version for CUDA 11.3 and other packages
!pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113
!pip install deeptools pybigwig scikit-learn einops gdown`
  },
  {
    title: "Clone Repository and Download Data",
    code: `# Clone the official repository
!git clone https://github.com/zzh24zzh/GeneralModel.git
%cd GeneralModel

# Download pre-trained models and reference data
!gdown 1-E5A7aAFp8Pz2P3U1gG9e3xW2f2g5t_3
!unzip data.zip`
  },
  {
    title: "Mount Google Drive to Access Your BAM File",
    code: `from google.colab import drive
drive.mount('/content/drive')`
  },
  {
    title: "Pre-process Your Input File",
    code: `# This is an example for a human BAM file stored in your Google Drive.
# 1. Convert your BAM file to a bigWig file
!bamCoverage --bam /content/drive/MyDrive/your_human_file.bam -o my_cell_line_atac.bigWig \\
  --outFileFormat bigwig --normalizeUsing RPGC \\
  --effectiveGenomeSize 2913022398 --binSize 10 --numberOfProcessors 2 \\
  --blackListFileName ./data/black_list.bed

# 2. Process the bigWig into the required .pickle format
!python atac_process.py my_cell_line_atac.bigWig`
  },
  {
    title: "Run Prediction",
    code: `# Run the prediction script for human data.
# Note: You may need to edit 'tt_pred_gw.py' to point to your generated
# 'my_cell_line_atac.pickle' file and define your output path.
!python tt_pred_gw.py

# The results will be saved as a .pickle file (e.g., 'spleen.pickle').
# You can load this file to analyze the predicted modalities.`
  }
      ]
    }
  }
}

const modelId = route.params.id as ModelId
const model = modelDataMap[modelId] ?? modelDataMap.epcot

const goBack = () => {
  router.push('/model')
}
</script>

<style scoped>
.el-tabs {
  margin-bottom: 0;
}

.section-block {
  margin-top: 0;
}

.model-page {
  padding: 2rem;
  max-width: 1100px;
  margin: auto;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  line-height: 1.6;
  color: #333;
}

.section-block {
  margin-top: 2rem;
}

.section-block h3 {
  margin-bottom: 0.8rem;
  font-size: 1.25rem;
  color: #409EFF;
}

pre {
  background: #f6f8fa;
  padding: 1rem;
  border-radius: 6px;
  overflow-x: auto;
}

.section-block .metadata-grid .meta-item {
  font-size: 0.85rem;
}

.meta-row {
  display: flex;
  margin-bottom: 0.8rem;
  line-height: 1.6;
}


.meta-key {
  font-weight: bold;
  min-width: 130px;
  flex-shrink: 0;
  white-space: nowrap;
}

.meta-val {
  white-space: pre-wrap;
  word-break: break-word;
  padding-left: 0;
  /* no indent here */
  text-indent: -130px;
  /* negative of .meta-key width */
  padding-left: 130px;
  /* push whole block right */
}

.schema-card,
.dataloader-card {
  font-size: 0.85rem;
  /* 或 12px，根据你想要的大小 */
  line-height: 1.5;
}

.code-like-block {
  border: 1px solid #e0e0e0;
  border-radius: 6px;
  overflow: hidden;
  margin-top: 0.5rem;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
}

.code-block-header {
  background-color: #e6e8ec;
  padding: 0.75rem 1rem;
  font-weight: 600;
  font-size: 0.95rem;
  border-bottom: 1px solid #e0e0e0;
}

.code-block-body {
  padding: 1rem;
  font-size: 0.85rem;
  line-height: 1.6;
  background-color: #ffffff;
}

.code-block-body ul {
  padding-left: 1.2rem;
  margin: 0.5rem 0 1rem 0;
}

.breadcrumb-link {
  color: #3b82f6;
  cursor: pointer;
  font-weight: 600;
  transition: color 0.3s ease;
  text-decoration: none;
}

.breadcrumb-link:hover {
  color: #1e40af;
  text-decoration: underline;
}

/* Navigation Button Styles */
.navigation-section {
  margin-top: 3rem;
  padding: 2rem 0;
  text-align: left;
}

.back-button {
  background: linear-gradient(135deg, #3b82f6, #1e40af);
  border: none;
  color: white;
  font-weight: 600;
  padding: 0.875rem 2rem;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
  transition: all 0.3s ease;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 1rem;
}

.back-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(59, 130, 246, 0.4);
  background: linear-gradient(135deg, #2563eb, #1d4ed8);
}

.back-button:active {
  transform: translateY(0);
  box-shadow: 0 2px 8px rgba(59, 130, 246, 0.3);
}

.back-icon {
  width: 18px;
  height: 18px;
  transition: transform 0.3s ease;
}

.back-button:hover .back-icon {
  transform: translateX(-2px);
}
</style>