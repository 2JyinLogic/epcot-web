<template>
  <div class="gradio-container">
    <!-- Interactive Use Cases Section -->
    <section class="use-cases-section">
      <!-- Use Cases Header -->
      <div class="use-cases-header">
        <h2>EPCOTv2 Prediction & Visualization Platform</h2>
        <p>Generate multi-modal genomic predictions and create interactive visualizations</p>
      </div>

      <!-- Mode Selection -->
      <div class="mode-selection-section">
        <div class="mode-tabs">
          <span 
            class="mode-tab" 
            :class="{ active: selectedMode === 'prediction' }"
            @click="selectedMode = 'prediction'"
          >
            Prediction
          </span>
          <span class="mode-separator">|</span>
          <span 
            class="mode-tab" 
            :class="{ active: selectedMode === 'visualization' }"
            @click="selectedMode = 'visualization'"
          >
            Visualization
          </span>
        </div>
      </div>

      <!-- Prediction Mode Content -->
      <div v-if="selectedMode === 'prediction'">
        <!-- Prediction Description -->
        <div class="mode-description-section">
          <h3>Predict diverse modalities by EPCOTv2</h3>
          <p>Generate comprehensive genomic and transcriptomic predictions using EPCOTv2's powerful AI model with your ATAC-seq data.</p>
        </div>

        <!-- Main Content -->
        <div class="main-content">
          <div class="content-layout">
            <div class="description-panel full-width">
              <!-- Step 1: Specify Genomic Region -->
              <div class="workflow-step">
                <div class="step-header">
                  <span class="step-number-badge">1</span>
                  <h4 class="step-title">Specify Genomic Region</h4>
                </div>
                <div class="region-controls">
                  <div class="region-control-item">
                    <label>Chromosome id:</label>
                    <div class="select-wrapper">
                      <select v-model="chromosomeId" class="control-select">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="X">X</option>
                        <option value="Y">Y</option>
                      </select>
                      <span class="select-arrow">▼</span>
                    </div>
                  </div>
                  
                  <div class="region-control-item">
                    <label>Interest region:</label>
                    <div class="region-inputs-inline">
                      <div class="region-input-wrapper">
                        <span class="region-label">From</span>
                        <input type="number" v-model="regionFrom" class="control-input-small" placeholder="0">
                      </div>
                      <span class="region-separator">—</span>
                      <div class="region-input-wrapper">
                        <span class="region-label">To</span>
                        <input type="number" v-model="regionTo" class="control-input-small" placeholder="0">
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Step 2: Select Modalities -->
              <div class="workflow-step">
                <div class="step-header">
                  <span class="step-number-badge">2</span>
                  <h4 class="step-title">Select the modalities you want to predict</h4>
                </div>
                <div class="modalities-grid">
                  <label class="checkbox-label">
                    <input type="checkbox" value="epi" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">epi</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="rna" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">rna</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="bru" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">bru</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="microc" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">microc</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="hic" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">hic</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="intacthic" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">intacthic</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="rna_strand" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">rna_strand</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="external_tf" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">external_tf</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="tt" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">tt</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="groseq" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">groseq</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="grocap" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">grocap</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="proseq" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">proseq</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="netcage" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">netcage</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="starr" v-model="selectedModalities" class="checkbox-input">
                    <span class="checkbox-text">starr</span>
                  </label>
                </div>
              </div>

              <!-- Step 3: Upload File & Run Prediction -->
              <div class="workflow-step">
                <div class="step-header">
                  <span class="step-number-badge">3</span>
                  <h4 class="step-title">Upload ATAC-seq Data & Run Prediction</h4>
                </div>
                <div class="form-group">
                  <div class="file-upload-area" @click="triggerFileUpload" @dragover.prevent @drop.prevent="handleFileDrop">
                    <input ref="fileInput" type="file" accept=".pickle" @change="handleFileSelect" style="display: none">
                    <div class="upload-content">
                      <p>Drop File Here</p>
                      <p>- or -</p>
                      <p>Click to Upload</p>
                    </div>
                  </div>
                  <p v-if="uploadedFile" class="file-name">✓ {{ uploadedFile.name }}</p>
                  <p class="file-hint">Processed ATAC-seq file in .pickle format</p>
                </div>
                <div class="action-buttons-workflow">
                  <button class="btn-primary-workflow" @click="submitPrediction" :disabled="!uploadedFile">
                    <span class="btn-icon">▶</span>
                    Run Prediction
                  </button>
                  <button class="btn-secondary-workflow" @click="clearForm">
                    <span class="btn-icon">↺</span>
                    Clear
                  </button>
                </div>
                <div class="status-indicator">
                  <div class="status-item" :class="{ active: uploadedFile }">
                    <span class="status-dot"></span>
                    <span class="status-text">{{ uploadedFile ? 'Ready to predict' : 'Waiting for file' }}</span>
                  </div>
                </div>
              </div>

              <!-- Step 4: Download Results -->
              <div class="workflow-step">
                <div class="step-header">
                  <span class="step-number-badge">4</span>
                  <h4 class="step-title">Download Results</h4>
                </div>
              <button class="btn-download-workflow" @click="downloadPredictions">
                Download Predictions (.npz)
              </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Visualization Mode Content -->
      <div v-if="selectedMode === 'visualization'">
        <!-- Visualization Description -->
        <div class="mode-description-section">
          <h3>Genomic Data Plot Generator</h3>
          <p>Upload prediction files to generate and visualize genomic data plots.</p>
        </div>

        <!-- Main Content -->
        <div class="main-content">
          <div class="content-layout">
            <div class="visualization-panel full-width">
              <!-- Step 1: Select Visual Modalities -->
              <div class="workflow-step">
                <div class="step-header">
                  <span class="step-number-badge">1</span>
                  <h4 class="step-title">Select visual modalities</h4>
                </div>
                <div class="modalities-grid">
                  <label class="checkbox-label">
                    <input type="checkbox" value="microc" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">microc</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="hic" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">hic</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="intacthic" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">intacthic</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="rna" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">rna</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="bru" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">bru</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="rna_strand" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">rna_strand</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="tt" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">tt</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="groseq" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">groseq</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="grocap" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">grocap</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="proseq" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">proseq</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="netcage" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">netcage</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="starr" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">starr</span>
                  </label>
                  <label class="checkbox-label">
                    <input type="checkbox" value="epi" v-model="selectedVisualModalities" class="checkbox-input">
                    <span class="checkbox-text">epi</span>
                  </label>
                </div>
              </div>

              <!-- Step 2: Epigenome Features -->
              <div class="workflow-step">
                <div class="step-header">
                  <span class="step-number-badge">2</span>
                  <h4 class="step-title">Epigenome features</h4>
                </div>
                <input 
                  type="text" 
                  v-model="epigenomeFeatures" 
                  class="control-input-full" 
                  placeholder="Enter features to visualize"
                  autocomplete="off"
                  autocorrect="off"
                  autocapitalize="off"
                  spellcheck="false"
                >
              </div>

              <!-- Step 3: Upload Prediction File & Generate Visualization -->
              <div class="workflow-step">
                <div class="step-header">
                  <span class="step-number-badge">3</span>
                  <h4 class="step-title">Upload Prediction File & Generate Visualization</h4>
                </div>
                <div class="form-group">
                  <div class="file-upload-area" @click="triggerPredictionUpload" @dragover.prevent @drop.prevent="handlePredictionFileDrop">
                    <input ref="predictionFileInput" type="file" accept=".npz" @change="handlePredictionFileSelect" style="display: none">
                    <div class="upload-content">
                      <p>Drop File Here</p>
                      <p>- or -</p>
                      <p>Click to Upload</p>
                    </div>
                  </div>
                  <p v-if="uploadedPredictionFile" class="file-name">✓ {{ uploadedPredictionFile.name }}</p>
                  <p class="file-hint">Prediction file in .npz format</p>
                </div>
                <div class="action-buttons-workflow">
                  <button class="btn-primary-workflow" @click="generatePlots" :disabled="!uploadedPredictionFile">
                    <span class="btn-icon">▶</span>
                    Generate Plots
                  </button>
                  <button class="btn-secondary-workflow" @click="clearPlotForm">
                    <span class="btn-icon">↺</span>
                    Clear
                  </button>
                </div>
                <div class="status-indicator">
                  <div class="status-item" :class="{ active: uploadedPredictionFile }">
                    <span class="status-dot"></span>
                    <span class="status-text">{{ uploadedPredictionFile ? 'Ready to generate' : 'Waiting for file' }}</span>
                  </div>
                </div>
              </div>

              <!-- Step 4: Preview & Download -->
              <div class="workflow-step">
                <div class="step-header">
                  <span class="step-number-badge">5</span>
                  <h4 class="step-title">Preview & Download</h4>
                </div>
              <div class="plot-preview">
                <div class="placeholder-icon">📊</div>
                <p>Generated plots will appear here</p>
              </div>
            </div>
          </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
  
<script setup lang="ts">
import { ref } from 'vue'

// Mode selection
const selectedMode = ref<'prediction' | 'visualization'>('prediction')

// Chromosome and region selection
const chromosomeId = ref('1')
const regionFrom = ref('0')
const regionTo = ref('0')

// Modality selection
const selectedModalities = ref<string[]>([])

// Form data for left panel (Prediction)
const uploadedFile = ref<File | null>(null)

// Form data for right panel (Plot Generator)
const selectedVisualModalities = ref<string[]>([])
const epigenomeFeatures = ref('')
const uploadedPredictionFile = ref<File | null>(null)
const errorMessage = ref('')

// File input refs
const fileInput = ref<HTMLInputElement>()
const predictionFileInput = ref<HTMLInputElement>()

// Methods for left panel (Prediction)
const triggerFileUpload = () => {
  fileInput.value?.click()
}

const handleFileSelect = (event: Event) => {
  const target = event.target as HTMLInputElement
  if (target.files && target.files[0]) {
    uploadedFile.value = target.files[0]
  }
}

const handleFileDrop = (event: DragEvent) => {
  if (event.dataTransfer?.files && event.dataTransfer.files[0]) {
    uploadedFile.value = event.dataTransfer.files[0]
  }
}

const clearForm = () => {
  selectedModalities.value = []
  chromosomeId.value = '1'
  regionFrom.value = '0'
  regionTo.value = '0'
  uploadedFile.value = null
}

const submitPrediction = () => {
  // TODO: Implement prediction submission
  console.log('Submitting prediction:', {
    selectedModalities: selectedModalities.value,
    chromosomeId: chromosomeId.value,
    regionFrom: regionFrom.value,
    regionTo: regionTo.value,
    uploadedFile: uploadedFile.value
  })
}

// Methods for right panel (Plot Generator)
const triggerPredictionUpload = () => {
  predictionFileInput.value?.click()
}

const handlePredictionFileSelect = (event: Event) => {
  const target = event.target as HTMLInputElement
  if (target.files && target.files[0]) {
    uploadedPredictionFile.value = target.files[0]
  }
}

const handlePredictionFileDrop = (event: DragEvent) => {
  if (event.dataTransfer?.files && event.dataTransfer.files[0]) {
    uploadedPredictionFile.value = event.dataTransfer.files[0]
  }
}

const clearPlotForm = () => {
  selectedVisualModalities.value = []
  epigenomeFeatures.value = ''
  uploadedPredictionFile.value = null
  errorMessage.value = ''
}

const generatePlots = () => {
  // TODO: Implement plot generation
  console.log('Generating plots:', {
    selectedVisualModalities: selectedVisualModalities.value,
    epigenomeFeatures: epigenomeFeatures.value,
    uploadedPredictionFile: uploadedPredictionFile.value
  })
}

const downloadPredictions = () => {
  // TODO: Implement download functionality
  console.log('Downloading predictions')
}
  </script>
  
<style scoped>
.gradio-container {
  font-family: Arial, sans-serif;
  background: #ffffff;
  margin: 0;
  padding: 0;
}

/* Use Cases Section */
.use-cases-section {
  background: #ffffff;
  border: 2px solid #045f9d;
  border-radius: 16px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  margin: 1.5rem auto 4rem;
  max-width: 1200px;
  overflow: hidden;
}

.use-cases-header {
  background: #045f9d;
  color: #fff;
  padding: 1rem 2rem 0.8rem;
  text-align: center;
}

.use-cases-header h2 {
  margin: 0 0 0.5rem 0;
  font-size: 1.5rem;
  font-weight: 600;
}

.use-cases-header p {
  margin: 0;
  font-size: 0.95rem;
  opacity: 0.9;
}

/* Mode Selection */
.mode-selection-section {
  padding: 1rem 2rem;
  background: #f8fafc;
  border-bottom: 1px solid #e2e8f0;
}

.mode-tabs {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.mode-tab {
  font-size: 1rem;
  font-weight: 500;
  color: #6b7280;
  cursor: pointer;
  transition: all 0.3s ease;
  padding: 0.25rem 0;
  position: relative;
}

.mode-tab:hover {
  color: #1c84cd;
}

.mode-tab.active {
  color: #1c84cd;
  font-weight: 600;
}

.mode-tab.active::after {
  content: '';
  position: absolute;
  bottom: -0.5rem;
  left: 0;
  right: 0;
  height: 2px;
  background: #1c84cd;
}

.mode-separator {
  color: #d1d5db;
  font-weight: 300;
}

/* Mode Description Section */
.mode-description-section {
  padding: 1.5rem 2rem;
  background: white;
  border-bottom: 1px solid #e2e8f0;
  max-width: 1200px;
  margin: 0 auto;
  padding-left: 150px;
  padding-right: 150px;
}

.mode-description-section h3 {
  margin: 0 0 0.5rem 0;
  font-size: 1.3rem;
  color: #1f2937;
  font-weight: 600;
}

.mode-description-section p {
  margin: 0;
  font-size: 0.95rem;
  color: #6b7280;
  line-height: 1.5;
}

/* Controls Section */
.controls-section {
  padding: 1.5rem 2rem;
  background: #f8fafc;
  border-bottom: 1px solid #e2e8f0;
}

.controls-row {
  display: flex;
  gap: 1rem;
  align-items: end;
  flex-wrap: nowrap;
  max-width: 1200px;
  margin: 0 auto;
}

.control-group {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  flex: 0.6;
}

.control-group:first-child {
  flex: 1;
  min-width: 0;
}

.control-group:nth-child(2) {
  flex: 0.3;
  min-width: 0;
}

.control-group:nth-child(3) {
  flex: 0.8;
  min-width: 0;
}

.control-group label {
  font-size: 0.9rem;
  font-weight: 500;
  color: #374151;
}

/* Control Select and Input Styling */
.select-wrapper {
  position: relative;
  display: flex;
  align-items: center;
  width: 100%;
}

.control-select, .control-input {
  padding: 0.5rem 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 0.9rem;
  background: white;
  transition: border-color 0.3s ease;
  min-width: 0;
  width: 100%;
}

.control-select {
  appearance: none;
  padding-right: 2.5rem;
}

.control-select:focus, .control-input:focus {
  outline: none;
  border-color: #007acc;
  box-shadow: 0 0 0 3px rgba(0, 122, 204, 0.1);
}

.control-input-full {
  padding: 0.5rem 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 0.9rem;
  background: white;
  transition: border-color 0.3s ease;
  width: 100%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

.control-input-full:focus {
  outline: none;
  border-color: #007acc;
  box-shadow: 0 0 0 3px rgba(0, 122, 204, 0.1);
}

/* 确保没有额外的浏览器默认样式 */
.control-input-full::-webkit-outer-spin-button,
.control-input-full::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.control-input-full::-webkit-search-cancel-button,
.control-input-full::-webkit-search-decoration {
  -webkit-appearance: none;
}

.select-arrow {
  position: absolute;
  right: 0.75rem;
  top: 50%;
  transform: translateY(-50%);
  font-size: 0.8rem;
  color: #6b7280;
  transition: transform 0.3s ease;
  pointer-events: none;
}

/* Region Controls Styling */
.region-controls {
  display: flex;
  gap: 1.5rem;
  align-items: flex-start;
}

.region-control-item {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.region-control-item label {
  font-size: 0.9rem;
  font-weight: 500;
  color: #374151;
}

.region-inputs-inline {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.region-inputs {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.region-input-wrapper {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  flex: 1;
}

.region-label {
  font-size: 0.85rem;
  color: #6b7280;
  font-weight: 500;
  white-space: nowrap;
}

.control-input-small {
  padding: 0.5rem 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 0.9rem;
  background: white;
  transition: border-color 0.3s ease;
  flex: 1;
  min-width: 0;
}

.control-input-small:focus {
  outline: none;
  border-color: #007acc;
  box-shadow: 0 0 0 3px rgba(0, 122, 204, 0.1);
}

.region-separator {
  color: #9ca3af;
  font-weight: 500;
  font-size: 1rem;
}

/* Hierarchical Menu Styling */
.category-group {
  flex: 0.8;
  min-width: 0;
  position: relative;
}

.hierarchical-menu {
  position: relative;
  width: 100%;
}

.main-category-button {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.5rem 0.75rem;
  background: white;
  border: 1px solid #d1d5db;
  border-bottom: 1px solid #d1d5db;
  border-radius: 6px;
  cursor: pointer;
  transition: border-color 0.3s ease;
  min-height: auto;
  font-size: 0.9rem;
}

.main-category-button:hover {
  background: white;
  border-color: #007acc;
  border-bottom: 1px solid #007acc;
  transform: none;
  box-shadow: none;
}

.main-category-button.active {
  background: white;
  border-color: #007acc;
  border-bottom: 1px solid #007acc;
  box-shadow: 0 0 0 3px rgba(0, 122, 204, 0.1);
}

.category-text {
  font-weight: 500;
  color: #374151;
  font-size: 0.9rem;
}

.expand-arrow {
  font-size: 0.8rem;
  color: #6b7280;
  transition: transform 0.3s ease;
  margin-left: 0.5rem;
}

.expand-arrow.rotated {
  transform: rotate(180deg);
}

.button-content {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  flex: 1;
}

.expanded-menu {
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  background: white;
  border: none;
  border-radius: 8px;
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
  z-index: 1000;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.3s ease;
  margin-top: 4px;
}

.expanded-menu.open {
  max-height: 500px;
}

.menu-content {
  padding: 0.75rem;
  display: flex;
  gap: 1rem;
  min-height: 280px;
}

.main-categories {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.main-category-item {
  border: 1px solid #e2e8f0;
  border-radius: 4px;
  overflow: hidden;
  transition: all 0.3s ease;
}

.main-category-item:hover {
  border-color: #007acc;
  box-shadow: 0 1px 4px rgba(0, 122, 204, 0.1);
}

.main-category-item.active {
  border-color: #007acc;
  background: #f0f9ff;
}

.main-category-header {
  display: flex;
  align-items: center;
  padding: 0.5rem 0.75rem;
  cursor: pointer;
  transition: background 0.3s ease;
  font-size: 0.9rem;
}

.main-category-header:hover {
  background: #f8fafc;
}

.main-category-item.active .main-category-header {
  background: #e0f2fe;
}

.category-label {
  font-weight: 500;
  color: #374151;
  flex: 1;
}

.subcategory-count {
  font-size: 0.75rem;
  color: #64748b;
  background: #f1f5f9;
  padding: 0.2rem 0.4rem;
  border-radius: 8px;
}

.sub-categories {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
  padding-left: 0.5rem;
}

.sub-category-item {
  display: flex;
  flex-direction: column;
  padding: 0.5rem 0.75rem;
  cursor: pointer;
  transition: all 0.3s ease;
  border: 1px solid #e2e8f0;
  border-radius: 4px;
  font-size: 0.85rem;
}

.sub-category-item:hover {
  background: #f0f9ff;
  border-color: #007acc;
}

.sub-category-item.active {
  background: #e0f2fe;
  border-color: #007acc;
  border-left: 3px solid #007acc;
}

.sub-category-label {
  font-weight: 500;
  color: #374151;
  font-size: 0.85rem;
}

.fixed-display {
  padding: 0.5rem 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  background: #f9fafb;
  min-width: 0;
  flex: 1;
  display: flex;
  align-items: center;
}

.fixed-value {
  font-size: 0.9rem;
  color: #374151;
  font-weight: 500;
}

/* Main Content */
.main-content {
  padding: 2rem;
  max-width: 1200px;
  margin: 0 auto;
}

.content-layout {
  display: grid;
  grid-template-columns: 5fr 5fr;
  gap: 2rem;
  max-width: 1200px;
  margin: 0 auto;
}

.description-panel, .visualization-panel {
  background: #ffffff;
  border-radius: 12px;
  padding: 2rem 1rem;
  display: flex;
  flex-direction: column;
}

.description-panel.full-width, .visualization-panel.full-width {
  grid-column: 1 / -1;
  margin: 0 100px;
}

.description-panel h3, .visualization-panel h3 {
  margin: 0 0 1rem 0;
  font-size: 1.3rem;
  color: #1f2937;
  font-weight: 600;
}

.panel-description {
  color: #6b7280;
  margin-bottom: 1.5rem;
  line-height: 1.5;
  font-size: 0.9rem;
}

/* Feature Highlights for Left Panel */
.feature-highlights {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 0.75rem;
  margin-bottom: 1.5rem;
}

.highlight-item {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1rem;
  background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
  border: 1px solid #fbbf24;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.highlight-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(251, 191, 36, 0.2);
  border-color: #f59e0b;
}

.highlight-icon {
  font-size: 1.2rem;
}

.highlight-text {
  font-size: 0.85rem;
  font-weight: 500;
  color: #92400e;
}

/* Upload Header */
.upload-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 0.5rem;
}

.file-format-hint {
  font-size: 0.8rem;
  color: #6b7280;
  font-weight: 400;
}

/* Enhanced Upload Area for Left Panel */
.file-upload-area.enhanced-left {
  border: 2px dashed #fbbf24;
  background: linear-gradient(135deg, #fffbeb 0%, #ffffff 100%);
  padding: 2.5rem;
  transition: all 0.3s ease;
  border-radius: 8px;
  cursor: pointer;
}

.file-upload-area.enhanced-left:hover {
  border-color: #f59e0b;
  background: linear-gradient(135deg, #fef3c7 0%, #fffbeb 100%);
  box-shadow: 0 4px 16px rgba(251, 191, 36, 0.15);
}

.upload-icon-large {
  font-size: 3rem;
  margin-bottom: 1rem;
  opacity: 0.7;
}

.upload-title {
  font-size: 1rem;
  font-weight: 600;
  color: #1f2937;
  margin: 0.5rem 0 0.25rem 0;
}

.upload-subtitle {
  font-size: 0.85rem;
  color: #6b7280;
  margin: 0;
}

/* File Info Card */
.file-info-card {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 1rem;
  background: #f0fdf4;
  border: 1px solid #86efac;
  border-radius: 8px;
  margin-top: 1rem;
}

.file-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 2rem;
  height: 2rem;
  background: #22c55e;
  color: white;
  border-radius: 50%;
  font-size: 0.9rem;
  font-weight: bold;
}

.file-name-display {
  flex: 1;
  font-size: 0.9rem;
  font-weight: 500;
  color: #166534;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.file-size {
  font-size: 0.8rem;
  color: #16a34a;
  font-weight: 500;
}

/* Enhanced Action Buttons */
.action-buttons-enhanced {
  display: flex;
  gap: 1rem;
  margin: 1.5rem 0;
}

.btn-clear-enhanced, .btn-submit-enhanced {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  padding: 0.875rem 1.5rem;
  border: none;
  border-radius: 8px;
  font-size: 0.95rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-clear-enhanced {
  background: #f3f4f6;
  color: #374151;
  border: 1px solid #d1d5db;
}

.btn-clear-enhanced:hover {
  background: #e5e7eb;
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.btn-submit-enhanced {
  background: #1c84cd;
  color: white;
}

.btn-submit-enhanced:hover {
  background: #1670b8;
  transform: translateY(-1px);
}

.btn-icon {
  font-size: 1rem;
}

/* Status Indicator */
.status-indicator {
  margin: 1.5rem 0;
  padding: 1rem;
  background: #f9fafb;
  border-radius: 8px;
  border: 1px solid #e5e7eb;
}

.status-item {
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.status-dot {
  width: 0.75rem;
  height: 0.75rem;
  border-radius: 50%;
  background: #9ca3af;
  transition: all 0.3s ease;
}

.status-item.active .status-dot {
  background: #22c55e;
  box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.2);
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.5;
  }
}

.status-text {
  font-size: 0.9rem;
  color: #6b7280;
  font-weight: 500;
}

.status-item.active .status-text {
  color: #166534;
  font-weight: 600;
}

/* Enhanced Download Section */
.download-section-enhanced {
  margin: 1.5rem 0;
}

.btn-download-enhanced {
  width: 100%;
  padding: 0.875rem 1.5rem;
  background: #1c84cd;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 0.95rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-download-enhanced:hover {
  background: #1670b8;
  transform: translateY(-1px);
}

/* Info Box */
.info-box {
  margin-top: 1.5rem;
  padding: 1.25rem;
  background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%);
  border: 1px solid #93c5fd;
  border-radius: 8px;
}

.info-header {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.75rem;
}

.info-icon {
  font-size: 1.2rem;
}

.info-title {
  font-size: 0.95rem;
  font-weight: 600;
  color: #1e40af;
}

.info-list {
  margin: 0;
  padding-left: 1.5rem;
  color: #1e40af;
  font-size: 0.85rem;
  line-height: 1.8;
}

.info-list li {
  margin: 0.25rem 0;
}

.form-group {
  margin-bottom: 1.5rem;
}

/* Workflow Steps */
.workflow-step {
  margin-bottom: 2rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid #e5e7eb;
}

.workflow-step:last-child {
  border-bottom: none;
  margin-bottom: 0;
  padding-bottom: 0;
}

.step-header {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  margin-bottom: 1rem;
}

.step-number-badge {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 2rem;
  height: 2rem;
  background: #1c84cd;
  color: white;
  border-radius: 50%;
  font-weight: 700;
  font-size: 1rem;
}

.step-title {
  margin: 0;
  font-size: 1.1rem;
  color: #1f2937;
  font-weight: 600;
}

.file-hint {
  margin: 0.5rem 0 0 0;
  font-size: 0.85rem;
  color: #9ca3af;
}

/* Workflow Buttons */
.action-buttons-workflow {
  display: flex;
  gap: 1rem;
  margin-bottom: 1rem;
}

.btn-primary-workflow {
  flex: 2;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  padding: 0.875rem 1.5rem;
  background: #1c84cd;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 0.95rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-primary-workflow:hover:not(:disabled) {
  background: #1670b8;
  transform: translateY(-1px);
}

.btn-primary-workflow:disabled {
  background: #d1d5db;
  cursor: not-allowed;
  opacity: 0.6;
}

.btn-secondary-workflow {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  padding: 0.875rem 1.5rem;
  background: #f3f4f6;
  color: #374151;
  border: 1px solid #d1d5db;
  border-radius: 8px;
  font-size: 0.95rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-secondary-workflow:hover {
  background: #e5e7eb;
  transform: translateY(-1px);
}

.btn-download-workflow {
  width: 100%;
  padding: 0.875rem 1.5rem;
  background: #1c84cd;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 0.95rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-download-workflow:hover {
  background: #1670b8;
  transform: translateY(-1px);
}

.form-group h4 {
  margin: 0 0 0.5rem 0;
  font-size: 1rem;
  color: #374151;
  font-weight: 600;
}

.form-group label {
  display: block;
  font-weight: 500;
  color: #374151;
  margin-bottom: 0.5rem;
  font-size: 0.9rem;
}

.form-select, .form-input {
  width: 100%;
  padding: 0.5rem 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 0.9rem;
  background: white;
  transition: border-color 0.3s ease;
}

.form-select:focus, .form-input:focus {
  outline: none;
  border-color: #1c84cd;
  box-shadow: 0 0 0 3px rgba(28, 132, 205, 0.1);
}

.region-inputs {
  display: flex;
  gap: 1rem;
}

.input-group {
  flex: 1;
}

.sub-label {
  font-size: 0.8rem;
  color: #64748b;
  margin-bottom: 0.25rem;
}

/* Modalities Grid */
.modalities-grid, .visual-modalities-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
  gap: 0.5rem;
}

.checkbox-label {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.5rem;
  border: 1px solid #e2e8f0;
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 0.85rem;
}

.checkbox-label:hover {
  background: #f8fafc;
  border-color: #1c84cd;
}

.checkbox-input {
  margin: 0;
}

.checkbox-text {
  font-weight: 500;
  color: #374151;
}

/* File Upload */
.file-upload-area {
  border: 2px dashed #d1d5db;
  border-radius: 8px;
  padding: 2rem;
  text-align: center;
  cursor: pointer;
  transition: all 0.3s ease;
  background: #f9fafb;
}

.file-upload-area:hover {
  border-color: #1c84cd;
  background: #f0f9ff;
}

.upload-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}

.upload-icon {
  font-size: 2rem;
  margin-bottom: 0.5rem;
}

.upload-content p {
  margin: 0;
  color: #6b7280;
  font-size: 0.9rem;
}

.file-name {
  margin-top: 0.5rem;
  font-size: 0.85rem;
  color: #1c84cd;
  font-weight: 500;
}

.upload-btn {
  background: #f8fafc;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  padding: 0.5rem 1rem;
  margin-bottom: 0.5rem;
  cursor: pointer;
  font-size: 0.9rem;
  transition: all 0.3s ease;
}

.upload-btn:hover {
  background: #f0f9ff;
  border-color: #1c84cd;
}

/* Epigenome Input */
.epigenome-input {
  position: relative;
}

.dropdown-arrow {
  position: absolute;
  right: 0.75rem;
  top: 50%;
  transform: translateY(-50%);
  color: #6b7280;
  pointer-events: none;
}

/* Action Buttons */
.action-buttons {
  display: flex;
  gap: 1rem;
  margin-top: 1.5rem;
}

.btn-clear {
  background: #f8fafc;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  padding: 0.75rem 1.5rem;
  cursor: pointer;
  font-size: 0.9rem;
  font-weight: 500;
  transition: all 0.3s ease;
  flex: 1;
}

.btn-clear:hover {
  background: #f0f9ff;
  border-color: #1c84cd;
}

.btn-submit {
  background: #1c84cd;
  border: none;
  border-radius: 6px;
  padding: 0.75rem 1.5rem;
  color: white;
  cursor: pointer;
  font-size: 0.9rem;
  font-weight: 500;
  transition: all 0.3s ease;
  flex: 1;
}

.btn-submit:hover {
  background: #1670b8;
  transform: translateY(-1px);
}

/* Download Section */
.download-section {
  margin: 1.5rem 0;
}

.btn-download {
  background: #1c84cd;
  border: none;
  border-radius: 6px;
  padding: 0.75rem 1.5rem;
  color: white;
  cursor: pointer;
  font-size: 0.9rem;
  font-weight: 500;
  transition: all 0.3s ease;
  width: 100%;
}

.btn-download:hover {
  background: #1670b8;
  transform: translateY(-1px);
}

/* Preview Section */
.preview-section {
  margin: 1.5rem 0;
}

.preview-section h4 {
  margin: 0 0 1rem 0;
  font-size: 1rem;
  color: #374151;
  font-weight: 600;
}

.plot-preview {
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  padding: 2rem;
  text-align: center;
  background: #f9fafb;
  min-height: 200px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.placeholder-icon {
  font-size: 3rem;
  margin-bottom: 1rem;
  opacity: 0.5;
}

.plot-preview p {
  color: #6b7280;
  margin: 0;
}

/* Error Section */
.error-section {
  margin: 1.5rem 0;
}

.error-section h4 {
  margin: 0 0 1rem 0;
  font-size: 1rem;
  color: #374151;
  font-weight: 600;
}

.error-display textarea {
  width: 100%;
  height: 100px;
  border: 1px solid #e2e8f0;
  border-radius: 6px;
  padding: 0.75rem;
  font-size: 0.85rem;
  background: #f9fafb;
  resize: vertical;
}

.error-display textarea:focus {
  outline: none;
  border-color: #1c84cd;
  box-shadow: 0 0 0 3px rgba(28, 132, 205, 0.1);
}

/* Responsive Design */
@media (max-width: 768px) {
  .content-layout {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
  
  .controls-row {
    flex-direction: column;
    gap: 1rem;
    align-items: stretch;
  }
  
  .control-group {
    flex: 1;
  }
  
  .feature-highlights {
    grid-template-columns: 1fr;
    gap: 0.5rem;
  }
  
  .upload-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 0.25rem;
  }
  
  .action-buttons, .action-buttons-enhanced {
    flex-direction: column;
  }
  
  .expanded-menu {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 90vw;
    max-width: 600px;
    max-height: 80vh;
    border-radius: 12px;
    border: 1px solid #d1d5db;
  }
}
</style>
  
  