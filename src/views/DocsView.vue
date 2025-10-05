<template>
  <div class="docs-layout">
    <!-- Left Sidebar Navigation -->
    <aside class="docs-sidebar">
      <div class="sidebar-header">
        <h2>EPCOT Documentation</h2>
        <p>Technical Guide</p>
      </div>
      
      <nav class="sidebar-nav">
        <div class="nav-section">
          <div class="nav-section-header">
            <h4>Getting Started</h4>
          </div>
          <ul class="nav-list">
            <li class="nav-item">
              <a href="#" class="nav-link" @click="navigateToSection('welcome')">
                <span class="nav-text">Overview</span>
              </a>
            </li>

          </ul>
        </div>

        <div class="nav-section">
          <div class="nav-section-header">
            <h4>Installation</h4>
          </div>
          <ul class="nav-list">
            <li class="nav-item has-submenu" :class="{ 'expanded': expandedItems.epcotv2Installation }">
              <a href="#" class="nav-link" @click="toggleSubmenu('epcotv2Installation', $event); navigateToSection('epcotv2-installation')">
                <span class="nav-text">EPCOTv2</span>
                <span class="nav-arrow" :class="{ 'rotated': expandedItems.epcotv2Installation }">›</span>
              </a>
              <ul class="submenu" v-show="expandedItems.epcotv2Installation">
                <li><a href="#dependencies" @click="scrollToSection('dependencies')" class="submenu-link">Dependencies</a></li>
                <li><a href="#installation-steps" @click="scrollToSection('installation-steps')" class="submenu-link">Installation Steps</a></li>
                <li><a href="#running-locally" @click="scrollToSection('running-locally')" class="submenu-link">Running Locally</a></li>
                <li><a href="#usage-steps" @click="scrollToSection('usage-steps')" class="submenu-link">Usage Steps</a></li>
                <li><a href="#notes" @click="scrollToSection('notes')" class="submenu-link">Notes</a></li>
                <li><a href="#references" @click="scrollToSection('references')" class="submenu-link">References</a></li>
              </ul>
            </li>
            <li class="nav-item has-submenu" :class="{ 'expanded': expandedItems.epcotInstallation }">
              <a href="#" class="nav-link" @click="toggleSubmenu('epcotInstallation', $event); navigateToSection('epcot-installation')">
                <span class="nav-text">EPCOT</span>
                <span class="nav-arrow" :class="{ 'rotated': expandedItems.epcotInstallation }">›</span>
              </a>
              <ul class="submenu" v-show="expandedItems.epcotInstallation">
                <li><a href="#epcot-environment-setup" @click="scrollToSection('epcot-environment-setup')" class="submenu-link">Environment Setup</a></li>
                <li><a href="#epcot-dependencies" @click="scrollToSection('epcot-dependencies')" class="submenu-link">Dependencies</a></li>
                <li><a href="#epcot-pretrained-models" @click="scrollToSection('epcot-pretrained-models')" class="submenu-link">Pretrained Models</a></li>
                <li><a href="#epcot-input-preparation" @click="scrollToSection('epcot-input-preparation')" class="submenu-link">Input Preparation</a></li>
                <li><a href="#epcot-colab-tutorial" @click="scrollToSection('epcot-colab-tutorial')" class="submenu-link">Colab Tutorial</a></li>
                <li><a href="#epcot-tf-motif-analysis" @click="scrollToSection('epcot-tf-motif-analysis')" class="submenu-link">TF Motif Analysis</a></li>
              </ul>
            </li>
          </ul>
        </div>

        <div class="nav-section">
          <div class="nav-section-header">
            <h4>Tutorials</h4>
          </div>
          <ul class="nav-list">
            <li class="nav-item has-submenu" :class="{ 'expanded': expandedItems.epcotv2Tutorial }">
              <a href="#" class="nav-link" @click="toggleSubmenu('epcotv2Tutorial', $event); navigateToSection('epcotv2-tutorial')">
                <span class="nav-text">EPCOTv2 Tutorial</span>
                <span class="nav-arrow" :class="{ 'rotated': expandedItems.epcotv2Tutorial }">›</span>
              </a>
              <ul class="submenu" v-show="expandedItems.epcotv2Tutorial">
                <li><a href="#epcotv2-introduction" @click="scrollToSection('epcotv2-introduction')" class="submenu-link">Introduction</a></li>
                <li><a href="#human-data-prediction" @click="scrollToSection('human-data-prediction')" class="submenu-link">Human Data</a></li>
                <li><a href="#mouse-data-prediction" @click="scrollToSection('mouse-data-prediction')" class="submenu-link">Mouse Data</a></li>
                <li><a href="#cross-species-analysis" @click="scrollToSection('cross-species-analysis')" class="submenu-link">Cross-species</a></li>
              </ul>
            </li>
            <li class="nav-item has-submenu" :class="{ 'expanded': expandedItems.epcotTutorial }">
              <a href="#" class="nav-link" @click="toggleSubmenu('epcotTutorial', $event); navigateToSection('epcot-tutorial')">
                <span class="nav-text">EPCOT Tutorial</span>
                <span class="nav-arrow" :class="{ 'rotated': expandedItems.epcotTutorial }">›</span>
              </a>
              <ul class="submenu" v-show="expandedItems.epcotTutorial">
                <li><a href="#epcot-introduction" @click="scrollToSection('epcot-introduction')" class="submenu-link">Introduction</a></li>
                <li><a href="#epcot-prerequisites" @click="scrollToSection('epcot-prerequisites')" class="submenu-link">Prerequisites</a></li>
                <li><a href="#epcot-quickstart" @click="scrollToSection('epcot-quickstart')" class="submenu-link">Quickstart</a></li>
                <li><a href="#epcot-inputs-outputs" @click="scrollToSection('epcot-inputs-outputs')" class="submenu-link">Inputs & Outputs</a></li>
                <li><a href="#epcot-predicted-modalities" @click="scrollToSection('epcot-predicted-modalities')" class="submenu-link">Modalities</a></li>
                <li><a href="#epcot-notes" @click="scrollToSection('epcot-notes')" class="submenu-link">Notes</a></li>
                <li><a href="#epcot-reference" @click="scrollToSection('epcot-reference')" class="submenu-link">Reference</a></li>
              </ul>
            </li>
          </ul>
        </div>


      </nav>
    </aside>

    <!-- Main Content Area -->
    <main class="docs-main">
      <div class="content-header">
        

        

      </div>

      <div class="content-body">
        <!-- Welcome Page -->
        <section v-if="currentSection === 'welcome'" class="content-section">
          <h2>Welcome to EPCOT Documentation</h2>
          
          <p>
            Welcome to the EPCOT (Enhanced Privacy and Context-Aware Optimization Toolkit) documentation. 
            This comprehensive guide will help you understand, install, and use EPCOT and EPCOTv2 frameworks 
            for predicting genomic modalities from ATAC-seq data.
          </p>
          
          <div class="info-box">
            <h3>Getting Started</h3>
            <p>Select a section from the left sidebar to begin exploring the documentation.</p>
          </div>
        </section>

        <!-- Installation Overview -->
        <section v-if="currentSection === 'installation'" class="content-section">
          <h2>Installation</h2>
          
          <p>
            This section provides comprehensive installation guides for both EPCOT and EPCOTv2 frameworks. 
            Choose the appropriate installation method based on your requirements and system configuration.
          </p>
        </section>

        <!-- Tutorials Overview -->
        <section v-if="currentSection === 'tutorials'" class="content-section">
          <h2>Tutorials</h2>
          
          <p>
            This section provides comprehensive tutorials and guides for using EPCOT and EPCOTv2 frameworks 
            effectively in your genomic research projects.
          </p>
        </section>

                <!-- EPCOTv2 Installation -->
        <section v-if="currentSection === 'epcotv2-installation'" class="content-section">
          <h2>EPCOTv2 Installation</h2>
          
          <p>
            This document explains how to install and run EPCOTv2, the latest version hosted on Hugging Face Spaces, 
            supporting inference on ATAC‑seq input to predict multiple genomic modalities in both human and mouse.
          </p>

          <section id="dependencies" class="content-subsection">
            <h3>Dependencies</h3>
            <ul>
              <li>Python 3.9+</li>
              <li>torch (PyTorch) with GPU support recommended</li>
              <li>huggingface_hub, gradio (Space frontend)</li>
              <li>Standard Python libraries: numpy, scipy, einops, etc.</li>
            </ul>
          </section>

          <section id="installation-steps" class="content-subsection">
            <h3>Installation Steps</h3>
            
            <h4>Clone the Space repository</h4>
            <div class="code-block">
              <code>git clone https://huggingface.co/spaces/luosanj/EPCOTv2</code><br>
              <code>cd EPCOTv2</code>
            </div>
            
            <h4>Create and activate virtual environment</h4>
            <div class="code-block">
              <code>python -m venv .venv</code><br>
              <code>source .venv/bin/activate</code>
            </div>
            
            <h4>Install dependencies</h4>
            <div class="code-block">
              <code>pip install -r requirements.txt</code>
            </div>
            <p>Otherwise manually install core packages:</p>
            <div class="code-block">
              <code>pip install torch gradio huggingface_hub numpy scipy einops</code>
            </div>
          </section>

          <section id="running-locally" class="content-subsection">
            <h3>Running Locally or in Colab</h3>
            <p>You can run the Gradio demo locally or on Google Colab:</p>
            
            <p><strong>Local execution:</strong></p>
            <div class="code-block">
              <code>python app.py</code>
            </div>
            
            <p><strong>Colab:</strong></p>
            <p>Open the Space and click "Open in Colab" (if enabled) to run interactive demo on GPU.</p>
          </section>

          <section id="usage-steps" class="content-subsection">
            <h3>Usage Steps</h3>
            <ol>
              <li>Prepare an ATAC‑seq input file in .pickle format using provided scripts (e.g. atac_process.py).</li>
              <li>Launch the demo either locally or via Colab.</li>
              <li>Upload the .pickle file and specify genome (human/mouse) and modalities to predict.</li>
              <li>Download outputs such as prediction archives and formatted .bigWig / .bedpe for visualization.</li>
            </ol>
          </section>

          <section id="notes" class="content-subsection">
            <h3>Notes</h3>
            <ul>
              <li>EPCOTv2 supports both human (hg38) and mouse (mm10) genomes.</li>
              <li>Internal scripts use LoRA fine-tuned models for efficient inference (see curriculum/loralib/utils.py).</li>
              <li>The interface is provided through Hugging Face Spaces and is built using the Gradio framework.</li>
            </ul>
          </section>

          <section id="references" class="content-subsection">
            <h3>References</h3>
            <ul>
              <li><a href="https://huggingface.co/spaces/luosanj/EPCOTv2" target="_blank">Hugging Face Space: luosanj/EPCOTv2</a></li>
              <li>Related methods described in the associated preprint and demo page: bioRxiv preprint</li>
            </ul>
          </section>
        </section>



                <!-- EPCOT Installation -->
        <section v-if="currentSection === 'epcot-installation'" class="content-section">
          <h2>EPCOT Installation</h2>
          
          <p>
            This guide walks you through the installation of the original EPCOT framework, which predicts 
            epigenomic features, chromatin organization, and transcriptional activity from DNA sequence 
            and cell-type-specific chromatin accessibility data.
          </p>

          <section id="epcot-environment-setup" class="content-subsection">
            <h3>Environment Setup</h3>
            <p>We recommend using conda to create an isolated environment:</p>
            <div class="code-block">
              <code>conda create -n epcot python=3.9<br>
              conda activate epcot</code>
            </div>
            <p>Then, install dependencies via pip:</p>
            <div class="code-block">
              <code>pip install -r requirements.txt</code>
            </div>
          </section>

          <section id="epcot-dependencies" class="content-subsection">
            <h3>Dependencies</h3>
            <p>The main dependencies are:</p>
            <ul>
              <li>einops==0.3.2</li>
              <li>kipoiseq==0.5.2</li>
              <li>numpy==1.19.5</li>
              <li>torch==1.10.1</li>
              <li>scipy==1.7.3</li>
              <li>scikit-learn==1.0.2</li>
            </ul>
          </section>

          <section id="epcot-pretrained-models" class="content-subsection">
            <h3>Pretrained Models</h3>
            <p>You can download the pretrained models (trained on DNA sequence and DNase-seq or ATAC-seq) from:</p>
            <ul>
              <li><strong>Google Drive:</strong> <a href="https://drive.google.com/drive/folders/1gsveyTgYwlXK5Ntnx5nLKSzIW3JvxLse" target="_blank">https://drive.google.com/drive/folders/1gsveyTgYwlXK5Ntnx5nLKSzIW3JvxLse</a></li>
              <li><strong>Zenodo:</strong> <a href="https://doi.org/10.5281/zenodo.7485616" target="_blank">https://doi.org/10.5281/zenodo.7485616</a></li>
            </ul>
          </section>

          <section id="epcot-input-preparation" class="content-subsection">
            <h3>Input Preparation</h3>
            <p>To prepare the required input formats (e.g., one-hot encoded DNA sequences and normalized DNase-seq), visit:</p>
            <p><a href="https://github.com/liu-bioinfo-lab/EPCOT/tree/main/Input" target="_blank">https://github.com/liu-bioinfo-lab/EPCOT/tree/main/Input</a></p>
            <p><strong>Note:</strong> All data used in EPCOT are based on the human hg38 reference genome.</p>
          </section>

          <section id="epcot-colab-tutorial" class="content-subsection">
            <h3>Colab Tutorial</h3>
            <p>A ready-to-run notebook is available to demonstrate EPCOT usage:</p>
            <p><strong>EPCOT_usage.ipynb:</strong> <a href="https://github.com/liu-bioinfo-lab/EPCOT/blob/main/EPCOT_usage.ipynb" target="_blank">https://github.com/liu-bioinfo-lab/EPCOT/blob/main/EPCOT_usage.ipynb</a></p>
          </section>

          <section id="epcot-tf-motif-analysis" class="content-subsection">
            <h3>TF Motif Analysis</h3>
            <p>For transcription factor sequence pattern visualization and comparison, see:</p>
            <ul>
              <li><strong>sequence_pattern.ipynb:</strong> <a href="https://github.com/liu-bioinfo-lab/EPCOT/blob/main/Data/sequence_pattern.ipynb" target="_blank">https://github.com/liu-bioinfo-lab/EPCOT/blob/main/Data/sequence_pattern.ipynb</a></li>
              <li><strong>GitHub page:</strong> <a href="https://zzh24zzh.github.io/epcot.github.io/" target="_blank">https://zzh24zzh.github.io/epcot.github.io/</a></li>
              <li><strong>Motif summary Excel:</strong> <a href="https://github.com/liu-bioinfo-lab/EPCOT/blob/main/Data/motif_comparison_summary.xls" target="_blank">https://github.com/liu-bioinfo-lab/EPCOT/blob/main/Data/motif_comparison_summary.xls</a></li>
            </ul>
          </section>
        </section>



        <!-- EPCOT Tutorial -->
        <section v-if="currentSection === 'epcot-tutorial'" class="content-section">
          <h2>EPCOT: Predicting Human Genomic Modalities from ATAC-seq</h2>
          
          <p>
            EPCOT is designed to predict various genomic modalities from ATAC-seq data, providing 
            insights into chromatin accessibility and gene regulation.
          </p>

          <section id="epcot-introduction" class="content-subsection">
            <h3>Introduction</h3>
            <p>EPCOT is a deep learning framework designed to predict multiple human genomic modalities from DNA sequence and a cell-type-specific ATAC-seq profile. It leverages a pre-training and fine-tuning structure to support cross-cell type prediction of:</p>
            <ul>
              <li>Epigenomic features (ChIP-seq for 236 TFs and 9 histone marks)</li>
              <li>Transcriptomic activity (CAGE-seq)</li>
              <li>3D chromatin contact maps (Hi-C, Micro-C, ChIA-PET)</li>
            </ul>
            <p>This tutorial demonstrates how to use the EPCOT_gradio repository to run the model and visualize results.</p>
          </section>

          <section id="epcot-prerequisites" class="content-subsection">
            <h3>Prerequisites</h3>
            <ul>
              <li>Python 3.9</li>
              <li>samtools</li>
              <li>(Optional) Google Colab with GPU support</li>
            </ul>
          </section>

          <section id="epcot-quickstart" class="content-subsection">
            <h3>Quickstart</h3>
            
            <h4>Clone repository and install dependencies</h4>
            <div class="code-block">
              <code>git clone https://github.com/zzh24zzh/EPCOT_gradio.git<br>
              cd EPCOT_gradio<br>
              pip install -r requirements.txt</code>
            </div>
            
            <h4>Download pretrained models and hg38 reference</h4>
            <div class="code-block">
              <code>python download.py</code>
            </div>
            
            <h4>Convert ATAC-seq BAM file to EPCOT input</h4>
            <div class="code-block">
              <code>python atac_process.py -b &lt;ATAC-seq.bam&gt; -p &lt;num_threads&gt;</code>
            </div>
            
            <p><strong>Notes:</strong></p>
            <ul>
              <li>Use BAM files processed with ENCODE's ATAC-seq pipeline</li>
              <li>Recommended to downsample to ~30M aligned reads using GATK DownsampleSam</li>
            </ul>
            
            <h4>Launch the Gradio demo</h4>
            <div class="code-block">
              <code>python gradio_epcot.py</code>
            </div>
            <p>This starts a local Gradio server with two interfaces:</p>
            <ul>
              <li><strong>Run Model:</strong> Submit genomic region and ATAC-seq .pickle input</li>
              <li><strong>Visualize Results:</strong> Upload predictions for interactive exploration</li>
            </ul>
          </section>

          <section id="epcot-inputs-outputs" class="content-subsection">
            <h3>Inputs & Outputs</h3>
            
            <h4>Input:</h4>
            <ul>
              <li>Processed .pickle file from ATAC-seq .bam</li>
            </ul>
            
            <h4>Outputs:</h4>
            <ul>
              <li><code>prediction_xxxx.npz</code>: raw model prediction</li>
              <li><code>formatted_xxxx.zip</code>: formatted data for visualization (ChIP/CAGE in .bigWig, contacts in .bedpe)</li>
            </ul>
          </section>

          <section id="epcot-predicted-modalities" class="content-subsection">
            <h3>Predicted Modalities</h3>
            
            <table class="modality-table">
              <thead>
                <tr>
                  <th>Modality</th>
                  <th>Format</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>ChIP-seq</td>
                  <td>arcsinh-transformed signal p-values</td>
                </tr>
                <tr>
                  <td>CAGE-seq</td>
                  <td>log2(x+1)-transformed signal</td>
                </tr>
                <tr>
                  <td>Micro-C</td>
                  <td>Observed/Expected contact ratio (1kb bins)</td>
                </tr>
                <tr>
                  <td>Hi-C</td>
                  <td>Observed/Expected contact ratio (5kb bins)</td>
                </tr>
                <tr>
                  <td>ChIA-PET</td>
                  <td>log2(x+1)-transformed Obs/Exp (5kb bins)</td>
                </tr>
              </tbody>
            </table>
          </section>

          <section id="epcot-notes" class="content-subsection">
            <h3>Notes</h3>
            <ul>
              <li>The model supports only human genome (hg38).</li>
              <li>All predictions are cell-type specific and can generalize to new cell types.</li>
              <li>Both DNase-seq and ATAC-seq are supported; use ATAC-seq by default.</li>
              <li>The Gradio UI also works in Google Colab.</li>
            </ul>
          </section>

          <section id="epcot-reference" class="content-subsection">
            <h3>Reference</h3>
            <p>Zhang, Z. et al. (2023). A generalizable framework to comprehensively predict epigenome, chromatin organization, and transcriptome. Nucleic Acids Research, 51(12), 5931–5947. <a href="https://doi.org/10.1093/nar/gkad436" target="_blank">https://doi.org/10.1093/nar/gkad436</a></p>
            
            <h4>Project repositories:</h4>
            <ul>
              <li><strong>Code:</strong> <a href="https://github.com/zzh24zzh/EPCOT_gradio" target="_blank">https://github.com/zzh24zzh/EPCOT_gradio</a></li>
              <li><strong>Core model:</strong> <a href="https://github.com/liu-bioinfo-lab/EPCOT" target="_blank">https://github.com/liu-bioinfo-lab/EPCOT</a></li>
            </ul>
          </section>
        </section>

        <!-- EPCOTv2 Tutorial -->
        <section v-if="currentSection === 'epcotv2-tutorial'" class="content-section">
          <h2>EPCOTv2: Predicting Human and Mouse Genomic Modalities from ATAC-seq</h2>
          
          <p>
            EPCOTv2 extends the capabilities of the original EPCOT framework to support both human 
            and mouse genomic data analysis, providing cross-species compatibility.
          </p>

          <section id="epcotv2-introduction" class="content-subsection">
            <h3>Introduction</h3>
            <p>EPCOT v2 predicts diverse molecular modalities for the central 500kb regions extracted from 600kb segments across the entire genome.</p>
          </section>

          <section id="human-data-prediction" class="content-subsection">
            <h3>Human Data Prediction</h3>
            
            <h4>Input file preparation</h4>
            <p>The initial BAM file is pre-processed to become the input for EPCOT v2. The name of the generated .bigWig file is formatted as '{cell_line_name}_atac'.</p>
            <p><strong>Note:</strong> The detailed locations (chrom id, start pos, end pos) of each 600kb region is stored in file "input_region_600kb.bed", which can be found on Github. There are 11,123 600kb regions across the whole human genome.</p>
            
            <h4>Generate the .bigWig file</h4>
            <div class="code-block">
              <code>bamCoverage --bam input.bam -o ${cell_line}_atac.bigWig --outFileFormat bigwig --normalizeUsing RPGC \<br>
              --effectiveGenomeSize 2913022398 --Offset 1 --binSize 10 --numberOfProcessors 12 \<br>
              --blackListFileName ../data/black_list.bed</code>
            </div>
            
            <h4>Run atac_process.py to generate the .pickle file</h4>
            <div class="code-block">
              <code>python atac_process.py ${cell_line}_atac.bigWig</code>
            </div>
            <p>This generates the .pickle file which is the required input format of EPCOT v2.</p>
            
            <h4>Prediction</h4>
            <p>Please confirm the directories of input ${cell_line}_atac.pickle file and the output ${cell_line}.pickle file. You can specify which modality you want to predict in file "tt_pred_gw.py" by modifying variable "pred_modalities".</p>
            
            <h4>Run the model execution file</h4>
            <div class="code-block">
              <code>python tt_pred_gw.py</code>
            </div>
            
            <h4>Extraction of each predicted modality</h4>
            <p>Assume the output file is called 'spleen.pickle'. Each predicted sample is the central 500kb from 600kb segments, composed of 500 1kb genomic bin.</p>
            
            <div class="code-block">
              <code>import pickle<br>
              with open('spleen.pickle', 'rb') as file:<br>
              &nbsp;&nbsp;&nbsp;&nbsp;spleen_pickle = pickle.load(file)<br><br>
              # All predicted modalities<br>
              spleen_pickle['epi']<br>
              spleen_pickle['rna'] # expected shape: (11123, 500, 3)<br>
              spleen_pickle['bru'] # expected shape: (11123, 500, 3)<br>
              spleen_pickle['microc']  # expected shape: (11123, 500, 500, 2)<br>
              spleen_pickle['hic'] # expected shape: (11123, 100, 100, 3) Hi-C is predicted at 5kb resolution.<br>
              spleen_pickle['intacthic'] # expected shape: (11123, 500, 2)<br>
              spleen_pickle['rna_strand'] # expected shape: (11123, 500, 2)<br>
              spleen_pickle['external_tf']<br>
              spleen_pickle['tt'] # expected shape: (11123, 500, 2)<br>
              spleen_pickle['groseq'] # expected shape: (11123, 500, 2)<br>
              spleen_pickle['grocap'] # expected shape: (11123, 500, 4)<br>
              spleen_pickle['proseq'] # expected shape: (11123, 500, 3)<br>
              spleen_pickle['netcage'] # expected shape: (11123, 500, 2)<br>
              spleen_pickle['starr'] # expected shape: (11123, 500, 1)</code>
            </div>
            
            <h4>Explanation of each modality that can be predicted:</h4>
            <ul>
              <li><strong>Epigenomic features.</strong> The list of epigenomic features can be found on Github in a file named "epigenomes.txt".</li>
              <li><strong>RNA-seq.</strong> 1. CAGE-seq 2. Total RNA-seq 3. PolyA+ RNA-seq</li>
              <li><strong>Bru-seq.</strong> 1. Bru-seq 2. BruUV-seq 3. BruChase-seq</li>
              <li><strong>Micro-c.</strong> 1. O/E normalized Micro-C 2. KR normalized Micro-C</li>
              <li><strong>Hi-C.</strong> 1. CTCF ChIA-PET 2. RNApol2 ChIA-PET 3. Hi-C</li>
              <li><strong>Intact Hi-C.</strong> 1. O/E normalized intact Hi-C 2. KR normalized intact Hi-C</li>
              <li><strong>RNA Strand.</strong> 1. Total RNA-seq (forward) 2. Total RNA-seq (reverse)</li>
              <li><strong>Additional TFs.</strong> The list of additional TFs can be found on Github in a file named unseeen_tf.txt</li>
              <li><strong>TT-seq.</strong> 1. TT-seq (forward) 2. TT-seq (reverse)</li>
              <li><strong>GRO-seq.</strong> 1. GRO-seq (forward) 2. GRO-seq (reverse)</li>
              <li><strong>GRO-cap.</strong> 1. GRO-cap (forward) 2. GRO-cap (reverse) 3. GRO-cap_wTAP (forward) 4. GRO-cap_wTAP(reverse)</li>
              <li><strong>PRO-seq.</strong> 1. PRO-seq (forward) 2. PRO-seq (reverse) 3. PRO-cap</li>
              <li><strong>NET-CAGE.</strong> 1. NET-CAGE (forward) 2. NET-CAGE (reverse)</li>
              <li><strong>STARR-seq.</strong> 1. STARR-seq</li>
            </ul>
          </section>

          <section id="mouse-data-prediction" class="content-subsection">
            <h3>Mouse Data Prediction</h3>
            
            <h4>Input file preparation</h4>
            <p>The initial BAM file is pre-processed to become the input for EPCOT v2. The name of the generated .bigWig file is formatted as '{cell_line_name}_atac'.</p>
            <p><strong>Note:</strong> The detailed locations (chrom id, start pos, end pos) of each 600kb region is stored in file "input_region_mm10.bed", which can be found on Github.</p>
            
            <h4>Generate the .bigWig file</h4>
            <div class="code-block">
              <code>bamCoverage --bam input.bam -o ${cell_line}_atac.bigWig --outFileFormat bigwig --normalizeUsing RPGC \<br>
              --effectiveGenomeSize 2913022398 --Offset 1 --binSize 10 --numberOfProcessors 12 \<br>
              --blackListFileName ../data/black_list.bed</code>
            </div>
            
            <h4>Run atac_process.py to generate the .pickle file</h4>
            <div class="code-block">
              <code>python atac_process.py ${cell_line}_atac.bigWig</code>
            </div>
            <p>This generates the .pickle file which is the required input format of EPCOT v2.</p>
            
            <h4>Prediction</h4>
            <p>Please confirm the directories of input ${cell_line}_atac.pickle file and the output ${cell_line}.pickle file. You can specify which modality you want to predict in file "pred_gw.py" by modifying variable "pred_modalities".</p>
            
            <h4>Run the model execution file</h4>
            <div class="code-block">
              <code>python pred_gw.py</code>
            </div>
            
            <h4>Extraction of each predicted modality</h4>
            <p>Assume the output file is called 'mouse.pickle'. Each predicted sample is the central 500kb from 600kb segments, composed of 500 1kb genomic bin.</p>
            
            <div class="code-block">
              <code>import pickle<br>
              with open('mouse.pickle', 'rb') as file:<br>
              &nbsp;&nbsp;&nbsp;&nbsp;mouse_pickle = pickle.load(file)<br><br>
              # All predicted modalities<br>
              mouse_pickle['epi'] # expected shape: (n, 500, 51)<br>
              mouse_pickle['cage'] # expected shape: (n, 500, 1)<br>
              mouse_pickle['trna'] # expected shape: (n, 500, 1)<br>
              mouse_pickle['prna'] # expected shape: (n, 500, 1)<br>
              mouse_pickle['pro'] # expected shape: (n, 500, 2)<br>
              mouse_pickle['gro'] # expected shape: (n, 500, 2)<br>
              mouse_pickle['microc'] # expected shape: (n, 500, 500, 2)<br>
              mouse_pickle['hic'] # expected shape: (n, 100, 100, 1)<br>
              mouse_pickle['netcage'] # expected shape: (n, 500, 2)<br>
              mouse_pickle['rcmc'] # expected shape: (n, 500, 500, 1)<br>
              # n is the number of bins user input</code>
            </div>
            
            <h4>Explanation of each modality that can be predicted:</h4>
            <ul>
              <li><strong>Epigenomic features.</strong> The list of epigenomic features can be found on Github in a file named "mouse_tfs.txt".</li>
              <li><strong>CAGE-seq.</strong></li>
              <li><strong>total RNA-seq.</strong></li>
              <li><strong>PolyA+ RNA-seq.</strong></li>
              <li><strong>PRO-seq.</strong> 1. PRO-seq (forward) 2. PRO-seq (reverse)</li>
              <li><strong>GRO-seq.</strong> 1. GRO-seq (forward) 2. GRO-seq (reverse)</li>
              <li><strong>Micro-c.</strong> 1. O/E normalized Micro-C 2. KR normalized Micro-C</li>
              <li><strong>O/E Hi-C.</strong></li>
              <li><strong>NET-CAGE.</strong> 1. NET-CAGE (forward) 2. NET-CAGE (reverse)</li>
              <li><strong>O/E RCMC.</strong></li>
            </ul>
          </section>

          <section id="cross-species-analysis" class="content-subsection">
            <h3>Cross-species Analysis</h3>
            <p>Compare and analyze genomic patterns across different species.</p>
            <ul>
              <li>Comparative genomics capabilities</li>
              <li>Species-specific model comparison</li>
              <li>Evolutionary insights</li>
            </ul>
          </section>
        </section>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'

// Reactive state to track which menu items are expanded
const expandedItems = reactive({
  epcotv2Installation: false,
  epcotInstallation: false,
  epcotTutorial: false,
  epcotv2Tutorial: false
})

// Reactive state to track current active section
const currentSection = ref('welcome')

// Function to toggle submenu visibility
const toggleSubmenu = (itemKey: string, event: Event) => {
  event.preventDefault()
  expandedItems[itemKey as keyof typeof expandedItems] = !expandedItems[itemKey as keyof typeof expandedItems]
}

// Function to navigate to a section
const navigateToSection = (sectionId: string) => {
  currentSection.value = sectionId
}

// Function to scroll to a section within the current page
const scrollToSection = (sectionId: string) => {
  const element = document.getElementById(sectionId)
  if (element) {
    element.scrollIntoView({ behavior: 'smooth' })
  }
}

// Function to get breadcrumb title based on current section
const getBreadcrumbTitle = () => {
  switch (currentSection.value) {
    case 'welcome':
      return 'Welcome'
    case 'installation':
      return 'Installation'
    case 'epcotv2-installation':
      return 'EPCOTv2 Installation'
    case 'epcot-installation':
      return 'EPCOT Installation'
    case 'tutorials':
      return 'Tutorials'
    case 'epcotv2-tutorial':
      return 'EPCOTv2 Tutorial'
    case 'epcot-tutorial':
      return 'EPCOT Tutorial'
    default:
      return 'Technical Guide'
  }
}
</script>

<style scoped>
.docs-layout {
  display: grid;
  grid-template-columns: 280px 1fr;
  min-height: calc(100vh - 64px - 180px);
  background-color: #f8f9fa;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

/* Left Sidebar Navigation */
.docs-sidebar {
  background: #ffffff;
  border-right: 1px solid #d1d5db;
  overflow-y: visible;
  position: sticky;
  top: 0;
  height: auto;
  min-height: calc(100vh - 64px - 180px);
  position: relative;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
  width: 300px;
}

/* Add subtle AWS-style pattern overlay */
.docs-sidebar::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: 
    linear-gradient(90deg, transparent 98%, rgba(232, 117, 0, 0.02) 100%);
  background-size: 20px 20px;
  pointer-events: none;
  z-index: 1;
}

.sidebar-header {
  padding: 24px 20px 20px;
  border-bottom: 1px solid #e5e7eb;
  background: #ffffff;
  position: relative;
  overflow: hidden;
  z-index: 2;
}

/* Remove AWS-style header background */
.sidebar-header::before {
  display: none;
}

.sidebar-header h2 {
  margin: 0 0 8px 0;
  font-size: 20px;
  font-weight: 700;
  color: #16191f;
  font-family: 'Amazon Ember', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  position: relative;
  z-index: 1;
  line-height: 1.2;
}

.sidebar-header p {
  margin: 0;
  font-size: 14px;
  color: #545b64;
  font-family: 'Amazon Ember', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  position: relative;
  z-index: 1;
  font-weight: 400;
  line-height: 1.4;
}

.sidebar-nav {
  padding: 0;
  position: relative;
  z-index: 2;
}

.nav-section {
  margin-bottom: 0;
  border-bottom: 1px solid #f3f4f6;
}

.nav-section:last-child {
  border-bottom: none;
}

.nav-section-header {
  display: flex;
  align-items: center;
  padding: 16px 20px 12px;
  background: #f9fafb;
  border-bottom: 1px solid #e5e7eb;
}

.nav-section-header h4 {
  margin: 0;
  font-size: 11px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  color: #374151;
  font-family: 'Amazon Ember', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  line-height: 1;
}

.nav-list {
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav-item {
  margin: 0;
  position: relative;
  overflow: hidden;
}

.nav-link {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 20px;
  color: #374151;
  text-decoration: none;
  font-size: 14px;
  font-weight: 400;
  font-family: 'Amazon Ember', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  transition: all 0.15s ease;
  border-left: 3px solid transparent;
  position: relative;
  overflow: hidden;
  background: transparent;
  line-height: 1.4;
}

.nav-text {
  flex: 1;
  font-weight: 400;
}

/* AWS-style hover effect */
.nav-link:hover {
  background: #f3f4f6;
  color: #16191f;
  border-left-color: #0d9488;
  font-weight: 500;
}

.nav-item.active .nav-link {
  background: #f0f9ff;
  color: #1e40af;
  border-left-color: #3b82f6;
  font-weight: 600;
  position: relative;
}

/* AWS-style active indicator */
.nav-item.active .nav-link::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 8px;
  width: 4px;
  height: 4px;
  background: #3b82f6;
  border-radius: 50%;
  transform: translateY(-50%);
  z-index: 2;
}

/* Active navigation item styling */
.nav-link.active {
  background: #f0f9ff;
  color: #1e40af;
  font-weight: 600;
  border-left-color: #3b82f6;
}

.nav-arrow {
  font-size: 12px;
  font-weight: 600;
  transition: transform 0.15s ease;
  color: #6b7280;
  margin-left: 8px;
  font-family: 'Amazon Ember', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

/* Arrow rotation for expanded state */
.nav-arrow.rotated {
  transform: rotate(90deg) !important;
  color: #374151;
}

/* Arrow hover effect */
.nav-link:hover .nav-arrow {
  color: #374151;
}

/* Expanded state styling */
.nav-item.expanded > .nav-link {
  background: #f9fafb;
  color: #16191f;
  border-left-color: #d1d5db;
  font-weight: 500;
}

.nav-item.expanded > .nav-link .nav-arrow {
  transform: rotate(90deg) !important;
  color: #374151;
}

/* Submenu Styles */
.submenu {
  list-style: none;
  margin: 0;
  padding: 0;
  background: #ffffff;
  border-left: 1px solid #e5e7eb;
  animation: slideDown 0.2s ease-out;
}

.submenu-link {
  display: block;
  padding: 8px 20px 8px 48px;
  color: #6b7280;
  text-decoration: none;
  font-size: 13px;
  font-family: 'Amazon Ember', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  transition: all 0.15s ease;
  border-left: 1px solid transparent;
  position: relative;
  font-weight: 400;
  line-height: 1.4;
}

.submenu-link::before {
  content: '•';
  position: absolute;
  left: 32px;
  color: #9ca3af;
  font-size: 14px;
  z-index: 1;
  font-weight: bold;
}

.submenu-link:hover {
  color: #374151;
  background: #f9fafb;
  border-left-color: #d1d5db;
  font-weight: 500;
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-4px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Enhanced scrollbar styling - AWS style */
.docs-sidebar::-webkit-scrollbar {
  width: 8px;
}

.docs-sidebar::-webkit-scrollbar-track {
  background: #f9fafb;
  border-radius: 0;
}

.docs-sidebar::-webkit-scrollbar-thumb {
  background: #d1d5db;
  border-radius: 4px;
  border: 2px solid #f9fafb;
}

.docs-sidebar::-webkit-scrollbar-thumb:hover {
  background: #9ca3af;
}

/* Enhanced page load animations */
.nav-item {
  animation: slideInLeft 0.4s ease-out forwards;
  opacity: 0;
  transform: translateX(-10px);
}

.nav-item:nth-child(1) { animation-delay: 0.05s; }
.nav-item:nth-child(2) { animation-delay: 0.1s; }
.nav-item:nth-child(3) { animation-delay: 0.15s; }
.nav-item:nth-child(4) { animation-delay: 0.2s; }
.nav-item:nth-child(5) { animation-delay: 0.25s; }
.nav-item:nth-child(6) { animation-delay: 0.3s; }

@keyframes slideInLeft {
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

/* Main Content Styles */
.docs-main {
  background-color: #fff;
  overflow-y: auto;
  padding: 0;
}

.content-header {
  padding: 24px 32px;
  background-color: #fff;
}

.breadcrumbs {
  font-size: 14px;
  color: #656d76;
  margin-bottom: 16px;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.breadcrumbs .separator {
  margin: 0 8px;
  color: #d0d7de;
}

.content-title h1 {
  margin: 0;
  font-size: 32px;
  font-weight: 600;
  color: #24292f;
  line-height: 1.25;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.content-actions {
  display: flex;
  gap: 12px;
  margin-bottom: 16px;
}

.action-btn {
  display: flex;
  align-items: center;
  gap: 6px;
  padding: 8px 12px;
  border: 1px solid #d0d7de;
  background-color: #fff;
  color: #24292f;
  border-radius: 6px;
  font-size: 14px;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  cursor: pointer;
  transition: all 0.2s;
}

.action-btn:hover {
  background-color: #f6f8fa;
  border-color: #0969da;
}

.btn-icon {
  font-size: 16px;
}

.publication-info {
  font-size: 14px;
  color: #656d76;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.content-body {
  padding: 32px;
  max-width: 1000px;
  margin: 0 auto;
}

.content-section {
  margin-bottom: 48px;
}

.content-section h2 {
  margin: 0 0 24px 0;
  font-size: 24px;
  font-weight: 600;
  color: #24292f;
  padding-bottom: 8px;
  border-bottom: 1px solid #e1e4e8;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.content-subsection {
  margin-bottom: 32px;
}

.content-subsection h3 {
  margin: 0 0 16px 0;
  font-size: 20px;
  font-weight: 600;
  color: #24292f;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.content-subsection h4 {
  margin: 0 0 12px 0;
  font-size: 16px;
  font-weight: 600;
  color: #24292f;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.content-section p {
  margin: 0 0 16px 0;
  font-size: 16px;
  line-height: 1.6;
  color: #24292f;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.info-box {
  background-color: #f6f8fa;
  border: 1px solid #d0d7de;
  border-radius: 6px;
  padding: 20px;
  margin: 24px 0;
}

.info-box h3 {
  margin: 0 0 16px 0;
  font-size: 18px;
  font-weight: 600;
  color: #24292f;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.info-box ul {
  margin: 0;
  padding-left: 20px;
}

.info-box li {
  margin-bottom: 8px;
  line-height: 1.5;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 24px;
  margin-top: 24px;
}

.feature-card {
  background-color: #f6f8fa;
  border: 1px solid #d0d7de;
  border-radius: 8px;
  padding: 20px;
  transition: transform 0.2s, box-shadow 0.2s;
}

.feature-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.feature-card h3 {
  margin: 0 0 12px 0;
  font-size: 18px;
  font-weight: 600;
  color: #0969da;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.feature-card p {
  margin: 0;
  font-size: 14px;
  line-height: 1.5;
  color: #656d76;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

/* Code Block Styles */
.code-block {
  background-color: #f6f8fa;
  border: 1px solid #e1e4e8;
  border-radius: 6px;
  padding: 16px;
  margin: 16px 0;
  font-family: 'SF Mono', Monaco, 'Cascadia Code', 'Roboto Mono', Consolas, 'Courier New', monospace;
}

.code-block h4 {
  margin: 0 0 12px 0;
  font-size: 14px;
  font-weight: 600;
  color: #24292f;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.code-block code {
  background-color: #f1f3f4;
  padding: 2px 6px;
  border-radius: 4px;
  font-size: 13px;
  color: #d73a49;
  font-family: 'SF Mono', Monaco, 'Cascadia Code', 'Roboto Mono', Consolas, 'Courier New', monospace;
}

.code-block ul {
  margin: 0;
  padding-left: 20px;
}

.code-block li {
  margin-bottom: 4px;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

/* Step List Styles */
.step-list {
  margin: 24px 0;
}

.step-item {
  margin-bottom: 32px;
  padding: 20px;
  background-color: #f8f9fa;
  border-radius: 6px;
  border-left: 4px solid #0969da;
}

.step-item h3 {
  margin: 0 0 16px 0;
  font-size: 18px;
  font-weight: 600;
  color: #24292f;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.step-item h4 {
  margin: 0 0 12px 0;
  font-size: 16px;
  font-weight: 600;
  color: #24292f;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.step-item .code-block {
  margin: 0;
}

/* Content Section Lists */
.content-section ul,
.content-section ol {
  margin: 16px 0;
  padding-left: 20px;
}

.content-section li {
  margin-bottom: 8px;
  line-height: 1.6;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.content-subsection ul,
.content-subsection ol {
  margin: 12px 0;
  padding-left: 20px;
}

.content-subsection li {
  margin-bottom: 6px;
  line-height: 1.5;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

/* Table Styles */
.modality-table {
  width: 100%;
  border-collapse: collapse;
  margin: 16px 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
}

.modality-table th,
.modality-table td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #e1e4e8;
}

.modality-table th {
  background-color: #f6f8fa;
  font-weight: 600;
  color: #24292f;
}

.modality-table td {
  color: #24292f;
}

.modality-table tr:hover {
  background-color: #f6f8fa;
}

/* Responsive Design */
@media (max-width: 1200px) {
  .docs-layout {
    grid-template-columns: 280px 1fr;
  }
}

@media (max-width: 768px) {
  .docs-layout {
    grid-template-columns: 1fr;
  }
  
  .docs-sidebar {
    display: none;
  }
  
  .content-header {
    padding: 16px 20px;
  }
  
  .content-body {
    padding: 20px;
  }
  
  .content-title h1 {
    font-size: 24px;
  }
  
  .features-grid {
    grid-template-columns: 1fr;
  }
}
</style>
