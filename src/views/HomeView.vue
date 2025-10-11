<template>
  <div class="home-container">
    <!-- Hero Section -->
    <section class="hero-section">
      <div class="hero-content">
        <!-- Left Column: Text -->
        <div class="hero-text">
          <h1>EPCOT</h1>
          <p>EPCOT is a deep learning framework designed to comprehensively predict multiple genomic modalities—including the epigenome, chromatin organization, transcriptome, and enhancer activity—within a single architecture. By leveraging a pre-training and fine-tuning strategy, EPCOT achieves strong performance in individual prediction tasks while maintaining generalizability across diverse cell and tissue types.</p>
          <p class="call-to-action">Try EPCOT and experience differently.</p>
          <button class="btn" @click="tryNow">
            Try it now
            <svg class="external-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6M15 3h6v6M10 14L21 3" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
          </button>
        </div>
        
        <!-- Right Column: Image -->
        <div class="hero-image">
          <img src="/images/epcot-overview.png" alt="EPCOT Overview" class="epcot-hero-image" />
        </div>
      </div>
    </section>

    <!-- Divider -->
    <div class="divider"></div>

    <!-- Interactive Use Cases Section -->
    <section class="use-cases-section">
      <!-- Use Cases Header -->
      <div class="use-cases-header">
        <h2>Interactive Use Cases Explorer</h2>
        <p>Explore genomic prediction scenarios with EPCOT</p>
      </div>

      <!-- Controls -->
      <div class="controls-section">
        <div class="controls-row">
          <div class="control-group category-group">
            <label>Category:</label>
            <div class="hierarchical-menu">
              <!-- Main Category Button -->
              <div class="main-category-button" @click="toggleMainMenu" :class="{ active: isMainMenuOpen }">
                <div class="button-content">
                  <span class="category-text">
                    {{ getMainCategoryLabel(selectedMainCategory) }}: {{ getCurrentSubCategoryLabel() }}
                  </span>
                </div>
                <div class="expand-arrow" :class="{ rotated: isMainMenuOpen }">▼</div>
              </div>
              
              <!-- Expanded Menu -->
              <div class="expanded-menu" v-if="isMainMenuOpen" :class="{ open: isMainMenuOpen }">
                <div class="menu-content">
                  <!-- Main Categories (Left Side) -->
                  <div class="main-categories">
                    <div 
                      v-for="(subs, mainKey) in subCategories" 
                      :key="mainKey"
                      class="main-category-item"
                      :class="{ active: selectedMainCategory === mainKey }"
                      @click="selectMainCategory(mainKey)"
                    >
                      <div class="main-category-header">
                        <span class="category-label">{{ getMainCategoryLabel(mainKey) }}</span>
                        <span class="subcategory-count">({{ subs.length }})</span>
                      </div>
                    </div>
                  </div>
                  
                  <!-- Sub Categories (Right Side) -->
                  <div class="sub-categories" v-if="isMainMenuOpen">
                    <div 
                      v-for="sub in currentSubCategories" 
                      :key="sub.value"
                      class="sub-category-item"
                      :class="{ active: selectedSubCategory === sub.value }"
                      @click="selectSubCategory(sub.value)"
                    >
                      <span class="sub-category-label">{{ sub.label }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="control-group">
            <label>Locus:</label>
            <div class="fixed-display">
              <span class="fixed-value">{{ currentLocus }}</span>
            </div>
          </div>
          
          <div class="control-group">
            <label>Cell type:</label>
            <div class="fixed-display">
              <span class="fixed-value">{{ currentCellType }}</span>
            </div>
          </div>
        </div>
      </div>

      <!-- Main Content -->
      <div class="main-content">
        <div class="content-layout">
          <!-- Left Panel: Description -->
          <div class="description-panel">
            <h3>{{ currentCategory.name }}</h3>
            <div class="definition">
              <h4>Definition</h4>
              <p>{{ currentCategory.definition }}</p>
            </div>
            
            <div class="outputs">
              <h4>Outputs</h4>
              <div class="output-tags">
                <span v-for="output in currentCategory.outputs" :key="output" class="output-tag">
                  {{ output }}
                </span>
              </div>
            </div>

            <div class="examples">
              <h4>Examples</h4>
              <div class="example-cards">
                <div v-for="(example, index) in currentCategory.examples" :key="index" class="example-card">
                  <div class="example-title">Example {{ index + 1 }}</div>
                  <div class="example-content" v-html="example"></div>
                </div>
              </div>
            </div>
          </div>

          <!-- Right Panel: Visualization -->
          <div class="visualization-panel">
            <h3>Visualization · {{ currentCategory.name }}</h3>
            <GenomeChart 
              :category="selectedMainCategory"
              :sub-category="selectedSubCategory"
              :cell-type="currentCellType"
              :is-flashing="isFlashing"
              @overlay-toggle="onOverlayToggle"
              @compare-toggle="onCompareToggle"
            />
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import GenomeChart from '@/components/GenomeChart.vue'

const router = useRouter()

// Type definitions
type MainCategory = 'tf-binding' | 'epigenomic' | 'gene-expression' | 'enhancer-activity' | '3d-chromatin' | 'nascent-rna' | 'rna-strand'
type SubCategory = '1000-tfs' | 'h3k27ac' | 'rna-seq' | 'starr-seq' | 'micro-c' | 'hic' | 'intact-hic' | 'bru-seq' | 'tt-seq' | 'gro-seq' | 'gro-cap' | 'pro-seq' | 'net-cage' | 'rna-strand-forward' | 'rna-strand-reverse'

interface SubCategoryItem {
  value: SubCategory
  label: string
}

interface CategoryData {
  name: string
  definition: string
  outputs: string[]
  examples: string[]
  legend: string[]
}

// Reactive state
const selectedMainCategory = ref<MainCategory>('tf-binding')
const selectedSubCategory = ref<SubCategory>('1000-tfs')
const overlay = ref(false)
const compare = ref(false)
const isFlashing = ref(false)
const isMainMenuOpen = ref(false)

// Data - Based on runbook examples
const runbookExamples: Record<SubCategory, { locus: string, cellType: string }> = {
  '1000-tfs': { locus: 'chr6:191752-691752', cellType: 'GM12878' }, // Additional TFs example - CBX2
  'h3k27ac': { locus: 'chr8:116638207-117138207', cellType: 'GM12878' }, // Epigenomic features - CTCF around AARD
  'rna-seq': { locus: 'chr3:15000000-15500000', cellType: 'GM12878' }, // RNA example - Total RNA around CAPN7
  'starr-seq': { locus: 'chr16:28731965-29231965', cellType: 'GM12878' }, // STARR-seq around CD19
  'micro-c': { locus: 'chr9:36834268-37334268', cellType: 'GM12878' }, // Micro-C around PAX5
  'hic': { locus: 'chr8:127535434-128035434', cellType: 'GM12878' }, // HiC around MYC
  'intact-hic': { locus: 'chr2:135914349-136414349', cellType: 'GM12878' }, // Intact Hi-C around CXCR4
  'bru-seq': { locus: 'chr14:106428615-106928615', cellType: 'GM12878' }, // Bru-seq around IGH
  'tt-seq': { locus: 'chr3:187521377-188021377', cellType: 'GM12878' }, // TT-seq around BCL6
  'gro-seq': { locus: 'chr3:8302155-8802155', cellType: 'GM12878' }, // GRO-seq around AID
  'gro-cap': { locus: 'chr3:8302155-8802155', cellType: 'GM12878' }, // GRO-cap around AID
  'pro-seq': { locus: 'chr2:135914349-136414349', cellType: 'GM12878' }, // Pro-seq around CXCR4
  'net-cage': { locus: 'chr19:41677279-42177279', cellType: 'GM12878' }, // NET-CAGE around CD79A
  'rna-strand-forward': { locus: 'chr3:187521377-188021377', cellType: 'GM12878' }, // RNA Strand around BCL6
  'rna-strand-reverse': { locus: 'chr3:187521377-188021377', cellType: 'GM12878' } // RNA Strand around BCL6
}

// Category labels mapping
const categoryLabels: Record<MainCategory, string> = {
  'tf-binding': 'TF-binding',
  'epigenomic': 'Epigenomic Features (Histones)',
  'gene-expression': 'Gene Expression',
  'enhancer-activity': 'Enhancer Activity',
  '3d-chromatin': '3D Chromatin Interaction',
  'nascent-rna': 'Nascent RNA Prediction',
  'rna-strand': 'RNA Strand-specific'
}

// 二级菜单数据 - 基于runbook的14个主要模态
const subCategories: Record<MainCategory, SubCategoryItem[]> = {
  'tf-binding': [
    { value: '1000-tfs', label: 'CBX2' }
  ],
  'epigenomic': [
    { value: 'h3k27ac', label: 'H3K27ac' }
  ],
  'gene-expression': [
    { value: 'rna-seq', label: 'RNA-seq' },
    { value: 'net-cage', label: 'NET-CAGE' }
  ],
  'enhancer-activity': [
    { value: 'starr-seq', label: 'STARR-seq' }
  ],
  '3d-chromatin': [
    { value: 'micro-c', label: 'Micro-C' },
    { value: 'hic', label: 'Hi-C' },
    { value: 'intact-hic', label: 'Intact Hi-C' }
  ],
  'nascent-rna': [
    { value: 'bru-seq', label: 'Bru-seq' },
    { value: 'tt-seq', label: 'TT-seq' },
    { value: 'gro-seq', label: 'GRO-seq' },
    { value: 'gro-cap', label: 'GRO-cap' },
    { value: 'pro-seq', label: 'PRO-seq' }
  ],
  'rna-strand': [
    { value: 'rna-strand-forward', label: 'RNA Forward Strand' },
    { value: 'rna-strand-reverse', label: 'RNA Reverse Strand' }
  ]
}

const categories: Record<SubCategory, CategoryData> = {
  '1000-tfs': {
    name: 'TF-binding: CBX2',
    definition: 'Predict binding profiles for 708 additional transcription factors from ATAC-seq and DNA sequence. This comprehensive prediction covers a wide range of TFs including transcriptional regulators, chromatin remodelers, and developmental factors.',
    outputs: ['TF binding scores', 'Transcription factor occupancy', 'Cell-type specific TF activity'],
    examples: [
      'GM12878: predicted <strong>CBX2</strong> binding at chr6:191752-691752 (around IRF4 gene). CBX2 shows strong binding signal in this regulatory region.',
      'K562: identified <strong>GATA1</strong> binding sites across erythroid-specific enhancers with high confidence scores.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: TF binding']
  },
  'h3k27ac': {
    name: 'Epigenomic Features: H3K27ac',
    definition: 'Predict 247 epigenomic features including histone modifications from ATAC-seq and DNA sequence. This includes active enhancers (H3K27ac), active promoters (H3K4me3), and repressive marks (H3K27me3, H3K9me3).',
    outputs: ['Histone modification signals', 'Epigenomic feature predictions', 'Regulatory element identification'],
    examples: [
      'GM12878: predicted <strong>H3K27ac</strong> signal at chr8:116638207-117138207 (around AARD gene). Strong active enhancer signal detected.',
      'K562: identified <strong>H3K4me3</strong> peaks at erythroid gene promoters with high confidence.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Epigenomic features']
  },
  'rna-seq': {
    name: 'Gene Expression: RNA-seq',
    definition: 'Predict RNA-seq expression including CAGE-seq, Total RNA-seq, and PolyA+ RNA-seq. This captures both steady-state mRNA levels and nascent transcription activity.',
    outputs: ['RNA-seq expression levels', 'Gene activity scores', 'Transcriptional state'],
    examples: [
      'GM12878: predicted Total RNA expression at chr3:15000000-15500000 (around CAPN7 gene). High expression signal detected in B-lymphocyte cells.',
      'K562: identified upregulated genes in erythroid differentiation pathway with strong RNA-seq signals.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: RNA-seq']
  },
  'starr-seq': {
    name: 'Enhancer Activity: STARR-seq',
    definition: 'Predict enhancer regulatory activity and functional validation scores using STARR-seq.',
    outputs: ['STARR-seq activity scores', 'Enhancer strength predictions', 'Regulatory element validation'],
    examples: [
      'GM12878: predicted enhancer activity at chr16:28731965-29231965 (around CD19).',
      'Example from runbook: STARR-seq prediction for enhancer activity.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Enhancer activity']
  },
  'micro-c': {
    name: '3D Chromatin: Micro-C',
    definition: 'Predict Micro-C contact maps including O/E normalized and KR normalized interactions.',
    outputs: ['Micro-C contact maps', 'Chromatin loops', 'Long-range interactions'],
    examples: [
      'GM12878: predicted O/E normalized Micro-C at chr9:36834268-37334268 (around PAX5).',
      'Example from runbook: Micro-C prediction with O/E normalization at index 0.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Micro-C contacts']
  },
  'hic': {
    name: '3D Chromatin: Hi-C',
    definition: 'Predict Hi-C interactions including CTCF ChIA-PET, RNApol2 ChIA-PET, and Hi-C.',
    outputs: ['Hi-C contact maps', 'ChIA-PET interactions', '3D structure predictions'],
    examples: [
      'GM12878: predicted Hi-C interactions at chr8:127535434-128035434 (around MYC).',
      'Example from runbook: Hi-C prediction with Hi-C at index 2.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Hi-C contacts']
  },
  'intact-hic': {
    name: '3D Chromatin: Intact Hi-C',
    definition: 'Predict Intact Hi-C contact maps including O/E normalized and KR normalized interactions.',
    outputs: ['Intact Hi-C contact maps', 'Chromatin loops', 'Long-range interactions'],
    examples: [
      'GM12878: predicted O/E normalized Intact Hi-C at chr2:135914349-136414349 (around CXCR4).',
      'Example from runbook: Intact Hi-C prediction with O/E normalization at index 0.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Intact Hi-C contacts']
  },
  'bru-seq': {
    name: 'Nascent RNA: Bru-seq',
    definition: 'Predict Bru-seq profiles including Bru-seq, BruUV-seq, and BruChase-seq.',
    outputs: ['Bru-seq profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'GM12878: predicted Bru-seq at chr14:106428615-106928615 (around IGH).',
      'Example from runbook: Bru-seq prediction with Bru-seq at index 0.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Bru-seq']
  },
  'tt-seq': {
    name: 'Nascent RNA: TT-seq',
    definition: 'Predict TT-seq profiles including forward and reverse strand transcription.',
    outputs: ['TT-seq profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'GM12878: predicted TT-seq at chr3:187521377-188021377 (around BCL6).',
      'Example from runbook: TT-seq prediction with forward and reverse strands.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: TT-seq']
  },
  'gro-seq': {
    name: 'Nascent RNA: GRO-seq',
    definition: 'Predict GRO-seq profiles including forward and reverse strand transcription.',
    outputs: ['GRO-seq profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'GM12878: predicted GRO-seq at chr3:8302155-8802155 (around AID).',
      'Example from runbook: GRO-seq prediction with forward and reverse strands.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: GRO-seq']
  },
  'gro-cap': {
    name: 'Nascent RNA: GRO-cap',
    definition: 'Predict GRO-cap profiles including forward, reverse, and GRO-cap_wTAP variants.',
    outputs: ['GRO-cap profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'GM12878: predicted GRO-cap at chr3:8302155-8802155 (around AID).',
      'Example from runbook: GRO-cap prediction with forward and reverse strands.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: GRO-cap']
  },
  'pro-seq': {
    name: 'Nascent RNA: PRO-seq',
    definition: 'Predict PRO-seq profiles including forward, reverse, and PRO-cap variants.',
    outputs: ['PRO-seq profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'GM12878: predicted PRO-seq at chr2:135914349-136414349 (around CXCR4).',
      'Example from runbook: PRO-seq prediction with forward and reverse strands.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: PRO-seq']
  },
  'net-cage': {
    name: 'Gene Expression: NET-CAGE',
    definition: 'Predict NET-CAGE profiles including forward and reverse strand transcription.',
    outputs: ['NET-CAGE profiles', 'Transcription rates', 'Gene expression levels'],
    examples: [
      'GM12878: predicted NET-CAGE at chr19:41677279-42177279 (around CD79A).',
      'Example from runbook: NET-CAGE prediction with forward and reverse strands.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: NET-CAGE']
  },
  'rna-strand-forward': {
    name: 'RNA Strand: Forward',
    definition: 'Predict forward strand Total RNA-seq profiles from ATAC-seq and DNA sequence.',
    outputs: ['Forward strand RNA', 'Sense transcription', 'Gene expression patterns'],
    examples: [
      'GM12878: predicted forward strand RNA at chr3:187521377-188021377 (around BCL6).',
      'Example from runbook: RNA Strand prediction with forward strand at index 0.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Forward RNA']
  },
  'rna-strand-reverse': {
    name: 'RNA Strand: Reverse',
    definition: 'Predict reverse strand Total RNA-seq profiles from ATAC-seq and DNA sequence.',
    outputs: ['Reverse strand RNA', 'Antisense transcription', 'Non-coding RNA patterns'],
    examples: [
      'GM12878: predicted reverse strand RNA at chr3:187521377-188021377 (around BCL6).',
      'Example from runbook: RNA Strand prediction with reverse strand at index 1.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Reverse RNA']
  }
}

// Computed
const currentSubCategories = computed(() => subCategories[selectedMainCategory.value] || [])
const currentCategory = computed(() => categories[selectedSubCategory.value] || categories['1000-tfs'])
const currentLocus = computed(() => runbookExamples[selectedSubCategory.value]?.locus || 'chr4:403.6‑404.1Mb')
const currentCellType = computed(() => runbookExamples[selectedSubCategory.value]?.cellType || 'MCF10A')

// Methods
const toggleMainMenu = () => {
  isMainMenuOpen.value = !isMainMenuOpen.value
}

const selectMainCategory = (mainKey: MainCategory) => {
  selectedMainCategory.value = mainKey
  // Auto-select first subcategory
  if (currentSubCategories.value.length > 0) {
    selectedSubCategory.value = currentSubCategories.value[0].value
  }
  flashViz()
}

const selectSubCategory = (subKey: SubCategory) => {
  selectedSubCategory.value = subKey
  isMainMenuOpen.value = false // Close menu after selection
  flashViz()
}

const getMainCategoryLabel = (category: MainCategory): string => {
  return categoryLabels[category] || category
}

const getCurrentSubCategoryLabel = (): string => {
  const currentSub = currentSubCategories.value.find(sub => sub.value === selectedSubCategory.value)
  return currentSub ? currentSub.label : ''
}

// Close menu when clicking outside
const handleClickOutside = (event: Event) => {
  const target = event.target as HTMLElement
  if (!target.closest('.hierarchical-menu')) {
    isMainMenuOpen.value = false
  }
}

// Add event listener for outside clicks
onMounted(() => {
  document.addEventListener('click', handleClickOutside)
})

onUnmounted(() => {
  document.removeEventListener('click', handleClickOutside)
})

const tryNow = () => {
  window.open('https://huggingface.co/spaces/drjieliu/EPCOTv2-app', '_blank')
}

const flashViz = () => {
  isFlashing.value = true
  setTimeout(() => {
    isFlashing.value = false
  }, 250)
}

const onOverlayToggle = (value: boolean) => {
  overlay.value = value
}

const onCompareToggle = (value: boolean) => {
  compare.value = value
}
</script>

<style scoped>
/* ===== Original base styles ===== */
.home-container {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  background: #ffffff;
}

/* Hero Section */
.hero-section {
  background: transparent;
  padding: 1rem 2rem;
  margin: 2rem 3rem;
}

.hero-content {
  max-width: 1180px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2.5rem;
  align-items: start;
}

.hero-text {
  text-align: left;
}

.hero-text h1 {
  font-size: 2.5rem;
  font-weight: bold;
  color: #000000;
  margin: 0 0 1.5rem 0;
  line-height: 1.2;
}

.hero-text p {
  font-size: 1.1rem;
  color: #374151;
  line-height: 1.6;
  margin: 0 0 2rem 0;
}

.hero-text .call-to-action {
  font-size: 1.1rem;
  color: #374151;
  line-height: 1.6;
  margin: 0 0 2rem 0;
}

.hero-text .btn {
  background: #1c84cd;
  color: #fff;
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  font-weight: bold;
  font-size: 1rem;
  transition: all 0.3s ease;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
}

.hero-text .btn .hf-icon {
  width: 20px;
  height: 20px;
}

.hero-text .btn .external-icon {
  width: 18px;
  height: 18px;
  margin-left: 0.25rem;
}

.hero-text .btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(28, 132, 205, 0.3);
}

.hero-image {
  display: flex;
  justify-content: flex-start;
  align-items: start;
  height: 100%;
  padding-top: 4.5rem;
}

.epcot-hero-image {
  width: 100%;
  height: auto;
  max-height: 600px;
  margin:1 rem;
  object-fit: cover;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transform: scale(1.1);
}

/* Divider */
.divider {
  max-width: 1200px;
  margin: 4px auto;
  border-top: 1px dashed #cbd5e1;
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
  flex: 1.2;
  min-width: 0;
}

.control-group:nth-child(2) {
  flex: 0.5;
  min-width: 0;
}

.control-group:nth-child(3) {
  flex: 0.6;
  min-width: 0;
}

.control-group label {
  font-size: 0.9rem;
  font-weight: 500;
  color: #374151;
}

/* 二级菜单样式 */
.dropdown-container {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.main-category, .sub-category {
  padding: 0.5rem 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 0.9rem;
  background: white;
  transition: border-color 0.3s ease;
  min-width: 0;
  flex: 1;
}

.main-category:focus, .sub-category:focus {
  outline: none;
  border-color: #007acc;
  box-shadow: 0 0 0 3px rgba(0, 122, 204, 0.1);
}

.select-wrapper {
  position: relative;
  display: flex;
  align-items: center;
}

.control-select {
  padding: 0.5rem 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 0.9rem;
  background: white;
  transition: border-color 0.3s ease;
  min-width: 0;
  flex: 1;
  appearance: none;
  padding-right: 2.5rem;
}

.control-select:focus {
  outline: none;
  border-color: #007acc;
  box-shadow: 0 0 0 3px rgba(0, 122, 204, 0.1);
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

.select-arrow.rotated {
  transform: translateY(-50%) rotate(180deg);
}

.control-input {
  padding: 0.5rem 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  font-size: 0.9rem;
  background: white;
  transition: border-color 0.3s ease;
  min-width: 0;
  flex: 1;
}

.control-input:focus {
  outline: none;
  border-color: #007acc;
  box-shadow: 0 0 0 3px rgba(0, 122, 204, 0.1);
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

/* Hierarchical Menu Styling */
.category-group {
  flex: 1.4;
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

.selected-subcategory {
  font-size: 0.8rem;
  color: #64748b;
  font-weight: 400;
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

.menu-content {
  padding: 1rem;
  display: flex;
  gap: 1rem;
  min-height: 300px;
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

.sub-category-desc {
  font-size: 0.75rem;
  color: #64748b;
  margin-top: 0.2rem;
  line-height: 1.3;
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

.description-panel {
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 1.5rem;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
}

.description-panel h3 {
  margin: 0 0 1rem 0;
  font-size: 1.3rem;
  color: #1f2937;
  font-weight: 600;
}

.definition {
  margin-bottom: 1.5rem;
}

.definition h4 {
  margin: 0 0 0.5rem 0;
  font-size: 1rem;
  color: #374151;
  font-weight: 600;
}

.definition p {
  margin: 0;
  font-size: 0.9rem;
  color: #6b7280;
  line-height: 1.5;
}

.outputs {
  margin-bottom: 1.5rem;
}

.outputs h4 {
  margin: 0 0 0.5rem 0;
  font-size: 1rem;
  color: #374151;
  font-weight: 600;
}

.output-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.output-tag {
  background: #eff6ff;
  color: #1d4ed8;
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
  font-size: 0.8rem;
  font-weight: 500;
}

.examples {
  margin-bottom: 1.5rem;
}

.examples h4 {
  margin: 0 0 0.5rem 0;
  font-size: 1rem;
  color: #374151;
  font-weight: 600;
}

.example-cards {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.example-card {
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 6px;
  padding: 0.75rem;
  font-size: 0.85rem;
  color: #475569;
  line-height: 1.4;
}

.visualization-panel {
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 1.5rem;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
}

.visualization-panel h3 {
  margin: 0 0 1rem 0;
  font-size: 1.3rem;
  color: #1f2937;
  font-weight: 600;
}

/* Responsive Design */
@media (max-width: 768px) {
  .hero-content {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
  
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
  
  .dropdown-menu {
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
