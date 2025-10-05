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
          <button class="btn" @click="tryNow">Try it now</button>
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
                  <span class="category-text">{{ getMainCategoryLabel(selectedMainCategory) }}</span>
                  <span class="selected-subcategory">{{ getCurrentSubCategoryLabel() }}</span>
                </div>
                <div class="expand-arrow" :class="{ rotated: isMainMenuOpen }">▼</div>
              </div>
              
              <!-- Expanded Menu -->
              <div class="expanded-menu" :class="{ open: isMainMenuOpen }">
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
            <input v-model="locus" type="text" class="control-input" placeholder="e.g., chr4:403.6‑404.1Mb" />
          </div>
          
          <div class="control-group">
            <label>Cell type:</label>
            <div class="select-wrapper">
              <select 
                v-model="selectedCell" 
                @change="onCellChange" 
                @focus="isCellMenuOpen = true"
                @blur="isCellMenuOpen = false"
                class="control-select"
              >
                <option v-for="cell in cellTypes" :key="cell" :value="cell">{{ cell }}</option>
              </select>
              <div class="select-arrow" :class="{ rotated: isCellMenuOpen }">▼</div>
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
            <h3>Visualization · {{ currentCategory.name }} · {{ selectedCell }}</h3>
            <div class="genome-viewer" :class="{ flash: isFlashing }">
              <div class="viewer-placeholder">
                <div class="placeholder-content">
                  <!-- <div class="placeholder-icon">🧬</div> -->
                  <div class="placeholder-text">Genome Viewer</div>
                  <div class="placeholder-mode">{{ currentCategory.name }}</div>
                </div>
              </div>
            </div>
            <div class="viewer-controls">
              <button 
                class="control-btn" 
                @click="toggleOverlay" 
                :class="{ active: overlay }"
              >
                Overlay Inputs
              </button>
              <button 
                class="control-btn" 
                @click="toggleCompare" 
                :class="{ active: compare }"
              >
                Prediction vs Experiment
              </button>
            </div>
            <div class="legend">
              <span v-for="item in currentCategory.legend" :key="item" class="legend-item">
                <i class="legend-dot"></i>{{ item }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'

// Type definitions
type MainCategory = 'tf-binding' | 'epigenomic' | 'gene-expression' | 'enhancer-activity' | '3d-chromatin' | 'nascent-rna'
type SubCategory = '1000-tfs' | 'h3k27ac' | 'h3k4me3' | 'h3k27me3' | 'h3k9me3' | 'h3k36me3' | 'h3k4me1' | 'h3k9ac' | 'h3k14ac' | 'h3k18ac' | 'h3k23ac' | 'h3k122ac' | 'rna-seq' | 'cage-seq' | 'net-cage' | 'starr-seq' | 'micro-c' | 'rcmc' | 'intact-hic' | 'chia-pet' | 'bru-seq' | 'tt-seq' | 'gro-seq' | 'bruuv-seq' | 'bruchase' | 'pro-seq' | 'pro-cap' | 'gro-cap'

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
const selectedCell = ref('MCF10A')
const locus = ref('chr4:403.6‑404.1Mb')
const overlay = ref(false)
const compare = ref(false)
const isFlashing = ref(false)
const isMainMenuOpen = ref(false)
const isCellMenuOpen = ref(false)

// Data
const cellTypes = ['MCF10A', 'K562', 'HepG2', 'GBM', '293T']

// Category labels mapping
const categoryLabels: Record<MainCategory, string> = {
  'tf-binding': 'TF-binding',
  'epigenomic': 'Epigenomic Features (Histones)',
  'gene-expression': 'Gene Expression',
  'enhancer-activity': 'Enhancer Activity',
  '3d-chromatin': '3D Chromatin Interaction',
  'nascent-rna': 'Nascent RNA Prediction'
}

// 二级菜单数据
const subCategories: Record<MainCategory, SubCategoryItem[]> = {
  'tf-binding': [
    { value: '1000-tfs', label: '1000 TFs' }
  ],
  'epigenomic': [
    { value: 'h3k27ac', label: 'H3K27ac' },
    { value: 'h3k4me3', label: 'H3K4me3' },
    { value: 'h3k27me3', label: 'H3K27me3' },
    { value: 'h3k9me3', label: 'H3K9me3' },
    { value: 'h3k36me3', label: 'H3K36me3' },
    { value: 'h3k4me1', label: 'H3K4me1' },
    { value: 'h3k9ac', label: 'H3K9ac' },
    { value: 'h3k14ac', label: 'H3K14ac' },
    { value: 'h3k18ac', label: 'H3K18ac' },
    { value: 'h3k23ac', label: 'H3K23ac' },
    { value: 'h3k122ac', label: 'H3K122ac' }
  ],
  'gene-expression': [
    { value: 'rna-seq', label: 'RNA-seq' },
    { value: 'cage-seq', label: 'CAGE-seq' },
    { value: 'net-cage', label: 'NET-CAGE' }
  ],
  'enhancer-activity': [
    { value: 'starr-seq', label: 'STARR-seq' }
  ],
  '3d-chromatin': [
    { value: 'micro-c', label: 'Micro-C' },
    { value: 'rcmc', label: 'RCMC' },
    { value: 'intact-hic', label: 'Intact Hi-C' },
    { value: 'chia-pet', label: 'ChIA-PET' }
  ],
  'nascent-rna': [
    { value: 'bru-seq', label: 'Bru-seq' },
    { value: 'tt-seq', label: 'TT-seq' },
    { value: 'gro-seq', label: 'GRO-seq' },
    { value: 'bruuv-seq', label: 'BruUV-seq' },
    { value: 'bruchase', label: 'BruChase' },
    { value: 'pro-seq', label: 'PRO-seq' },
    { value: 'pro-cap', label: 'PRO-cap' },
    { value: 'gro-cap', label: 'GRO-cap' }
  ]
}

const categories: Record<SubCategory, CategoryData> = {
  '1000-tfs': {
    name: 'TF-binding: 1000 TFs',
    definition: 'Predict transcription factor binding profiles across 1000+ transcription factors from ATAC-seq and DNA sequence.',
    outputs: ['TF occupancy scores', 'Binding site predictions', 'Cell-type specific TF activity'],
    examples: [
      'MCF10A: predicted <strong>CHRNA9</strong> locus TF binding changes in response to TGF-β1.',
      'K562: identified key regulatory TFs including <strong>CUX1</strong> driving cell-specific activity.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: TF binding']
  },
  'h3k27ac': {
    name: 'Epigenomic features: H3K27ac',
    definition: 'Predict H3K27ac histone modification patterns associated with active enhancers and promoters.',
    outputs: ['H3K27ac signals', 'Enhancer activity predictions', 'Promoter identification'],
    examples: [
      'GBM: predicted H3K27ac patterns consistent with enhancer activity.',
      'MCF10A: captured dynamic H3K27ac modifications at <strong>CHRNA9</strong> locus.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K27ac']
  },
  'h3k4me3': {
    name: 'Epigenomic features: H3K4me3',
    definition: 'Predict H3K4me3 histone modification patterns associated with active promoters.',
    outputs: ['H3K4me3 signals', 'Promoter activity predictions', 'TSS identification'],
    examples: [
      'K562: predicted H3K4me3 patterns at active promoters.',
      'MCF10A: identified promoter regions with high H3K4me3 signals.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K4me3']
  },
  'rna-seq': {
    name: 'Gene expression: RNA-seq',
    definition: 'Predict gene expression levels from chromatin accessibility data using RNA-seq measurements.',
    outputs: ['RNA-seq expression levels', 'Gene activity scores', 'Transcriptional state'],
    examples: [
      'MCF10A: predicted transcriptional changes at <strong>CHRNA9</strong> locus match experimental RNA-seq.',
      'Cross-cell validation: predictions consistent across multiple cell types.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: RNA-seq']
  },
  'cage-seq': {
    name: 'Gene expression: CAGE-seq',
    definition: 'Predict transcription start site activity from chromatin accessibility data using CAGE-seq.',
    outputs: ['CAGE-seq TSS activity', 'Promoter strength', 'TSS identification'],
    examples: [
      'K562: predicted CAGE-seq signals at active promoters.',
      'MCF10A: identified novel TSSs with high CAGE-seq activity.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: CAGE-seq']
  },
  'starr-seq': {
    name: 'Enhancer activity: STARR-seq',
    definition: 'Predict enhancer regulatory activity and functional validation scores using STARR-seq.',
    outputs: ['STARR-seq activity scores', 'Enhancer strength predictions', 'Regulatory element validation'],
    examples: [
      'Predicted enhancer activity for thousands of regulatory elements.',
      'Cross-validation with experimental STARR-seq measurements.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Enhancer activity']
  },
  'micro-c': {
    name: '3D chromatin interaction: Micro-C',
    definition: 'Predict 3D chromatin organization and long-range interactions from 1D accessibility data using Micro-C.',
    outputs: ['Micro-C contact maps', 'Chromatin loops', 'Long-range interactions'],
    examples: [
      'Predicted enhancer-promoter loops validated by <strong>Micro-C</strong>.',
      'Detected chromatin contacts consistent with experimental measurements.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Micro-C contacts']
  },
  'bru-seq': {
    name: 'Nascent RNA prediction: Bru-seq',
    definition: 'Predict nascent RNA transcription profiles and transcriptional dynamics using Bru-seq.',
    outputs: ['Bru-seq profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'MCF10A: captured TGF-β1-induced transcriptional changes at <strong>CHRNA9</strong>.',
      'GBM: predicted novel eRNAs later validated by H3K27ac HiChIP.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Bru-seq']
  },
  // Add default entries for all other subcategories
  'h3k27me3': {
    name: 'Epigenomic features: H3K27me3',
    definition: 'Predict H3K27me3 histone modification patterns associated with repressed regions.',
    outputs: ['H3K27me3 signals', 'Repressed region predictions', 'Polycomb targets'],
    examples: [
      'K562: predicted H3K27me3 patterns at repressed regions.',
      'MCF10A: identified polycomb target regions.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K27me3']
  },
  'h3k9me3': {
    name: 'Epigenomic features: H3K9me3',
    definition: 'Predict H3K9me3 histone modification patterns associated with heterochromatin.',
    outputs: ['H3K9me3 signals', 'Heterochromatin predictions', 'Repressed domains'],
    examples: [
      'K562: predicted H3K9me3 patterns at heterochromatin regions.',
      'MCF10A: identified repressed chromatin domains.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K9me3']
  },
  'h3k36me3': {
    name: 'Epigenomic features: H3K36me3',
    definition: 'Predict H3K36me3 histone modification patterns associated with transcribed regions.',
    outputs: ['H3K36me3 signals', 'Transcription elongation predictions', 'Gene body activity'],
    examples: [
      'K562: predicted H3K36me3 patterns at actively transcribed genes.',
      'MCF10A: identified gene body transcription activity.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K36me3']
  },
  'h3k4me1': {
    name: 'Epigenomic features: H3K4me1',
    definition: 'Predict H3K4me1 histone modification patterns associated with enhancers.',
    outputs: ['H3K4me1 signals', 'Enhancer predictions', 'Regulatory element identification'],
    examples: [
      'K562: predicted H3K4me1 patterns at enhancer regions.',
      'MCF10A: identified active enhancer elements.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K4me1']
  },
  'h3k9ac': {
    name: 'Epigenomic features: H3K9ac',
    definition: 'Predict H3K9ac histone modification patterns associated with active chromatin.',
    outputs: ['H3K9ac signals', 'Active chromatin predictions', 'Regulatory activity'],
    examples: [
      'K562: predicted H3K9ac patterns at active regulatory regions.',
      'MCF10A: identified active chromatin domains.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K9ac']
  },
  'h3k14ac': {
    name: 'Epigenomic features: H3K14ac',
    definition: 'Predict H3K14ac histone modification patterns associated with active chromatin.',
    outputs: ['H3K14ac signals', 'Active chromatin predictions', 'Regulatory activity'],
    examples: [
      'K562: predicted H3K14ac patterns at active regulatory regions.',
      'MCF10A: identified active chromatin domains.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K14ac']
  },
  'h3k18ac': {
    name: 'Epigenomic features: H3K18ac',
    definition: 'Predict H3K18ac histone modification patterns associated with active chromatin.',
    outputs: ['H3K18ac signals', 'Active chromatin predictions', 'Regulatory activity'],
    examples: [
      'K562: predicted H3K18ac patterns at active regulatory regions.',
      'MCF10A: identified active chromatin domains.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K18ac']
  },
  'h3k23ac': {
    name: 'Epigenomic features: H3K23ac',
    definition: 'Predict H3K23ac histone modification patterns associated with active chromatin.',
    outputs: ['H3K23ac signals', 'Active chromatin predictions', 'Regulatory activity'],
    examples: [
      'K562: predicted H3K23ac patterns at active regulatory regions.',
      'MCF10A: identified active chromatin domains.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K23ac']
  },
  'h3k122ac': {
    name: 'Epigenomic features: H3K122ac',
    definition: 'Predict H3K122ac histone modification patterns associated with active chromatin.',
    outputs: ['H3K122ac signals', 'Active chromatin predictions', 'Regulatory activity'],
    examples: [
      'K562: predicted H3K122ac patterns at active regulatory regions.',
      'MCF10A: identified active chromatin domains.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: H3K122ac']
  },
  'net-cage': {
    name: 'Gene expression: NET-CAGE',
    definition: 'Predict nascent transcription start site activity using NET-CAGE.',
    outputs: ['NET-CAGE TSS activity', 'Nascent transcription predictions', 'TSS identification'],
    examples: [
      'K562: predicted NET-CAGE signals at active TSSs.',
      'MCF10A: identified nascent transcription start sites.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: NET-CAGE']
  },
  'rcmc': {
    name: '3D chromatin interaction: RCMC',
    definition: 'Predict 3D chromatin organization using RCMC.',
    outputs: ['RCMC contact maps', 'Chromatin interactions', 'Long-range contacts'],
    examples: [
      'Predicted chromatin interactions using RCMC data.',
      'Detected long-range chromatin contacts.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: RCMC contacts']
  },
  'intact-hic': {
    name: '3D chromatin interaction: Intact Hi-C',
    definition: 'Predict 3D chromatin organization using intact Hi-C.',
    outputs: ['Hi-C contact maps', 'Chromatin loops', 'TAD boundaries'],
    examples: [
      'Predicted chromatin loops using intact Hi-C.',
      'Detected topologically associating domains.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: Hi-C contacts']
  },
  'chia-pet': {
    name: '3D chromatin interaction: ChIA-PET',
    definition: 'Predict protein-mediated chromatin interactions using ChIA-PET.',
    outputs: ['ChIA-PET interactions', 'Protein-mediated loops', 'Regulatory contacts'],
    examples: [
      'Predicted protein-mediated chromatin interactions.',
      'Detected regulatory element contacts.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: ChIA-PET contacts']
  },
  'tt-seq': {
    name: 'Nascent RNA prediction: TT-seq',
    definition: 'Predict nascent RNA transcription using TT-seq.',
    outputs: ['TT-seq profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'MCF10A: predicted TT-seq transcription profiles.',
      'GBM: identified nascent transcription patterns.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: TT-seq']
  },
  'gro-seq': {
    name: 'Nascent RNA prediction: GRO-seq',
    definition: 'Predict nascent RNA transcription using GRO-seq.',
    outputs: ['GRO-seq profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'MCF10A: predicted GRO-seq transcription profiles.',
      'GBM: identified nascent transcription patterns.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: GRO-seq']
  },
  'bruuv-seq': {
    name: 'Nascent RNA prediction: BruUV-seq',
    definition: 'Predict nascent RNA transcription using BruUV-seq.',
    outputs: ['BruUV-seq profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'MCF10A: predicted BruUV-seq transcription profiles.',
      'GBM: identified nascent transcription patterns.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: BruUV-seq']
  },
  'bruchase': {
    name: 'Nascent RNA prediction: BruChase',
    definition: 'Predict nascent RNA transcription using BruChase.',
    outputs: ['BruChase profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'MCF10A: predicted BruChase transcription profiles.',
      'GBM: identified nascent transcription patterns.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: BruChase']
  },
  'pro-seq': {
    name: 'Nascent RNA prediction: PRO-seq',
    definition: 'Predict nascent RNA transcription using PRO-seq.',
    outputs: ['PRO-seq profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'MCF10A: predicted PRO-seq transcription profiles.',
      'GBM: identified nascent transcription patterns.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: PRO-seq']
  },
  'pro-cap': {
    name: 'Nascent RNA prediction: PRO-cap',
    definition: 'Predict nascent RNA transcription using PRO-cap.',
    outputs: ['PRO-cap profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'MCF10A: predicted PRO-cap transcription profiles.',
      'GBM: identified nascent transcription patterns.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: PRO-cap']
  },
  'gro-cap': {
    name: 'Nascent RNA prediction: GRO-cap',
    definition: 'Predict nascent RNA transcription using GRO-cap.',
    outputs: ['GRO-cap profiles', 'Transcription rates', 'Nascent RNA levels'],
    examples: [
      'MCF10A: predicted GRO-cap transcription profiles.',
      'GBM: identified nascent transcription patterns.'
    ],
    legend: ['Input: ATAC', 'Input: DNA', 'Prediction: GRO-cap']
  }
}

// Computed
const currentSubCategories = computed(() => subCategories[selectedMainCategory.value] || [])
const currentCategory = computed(() => categories[selectedSubCategory.value] || categories['1000-tfs'])

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

const getSubCategoryDescription = (subKey: SubCategory): string => {
  const category = categories[subKey]
  return category ? category.definition.substring(0, 60) + '...' : ''
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

const onMainCategoryChange = () => {
  // 当主类别改变时，自动选择第一个子类别
  if (currentSubCategories.value.length > 0) {
    selectedSubCategory.value = currentSubCategories.value[0].value
  }
  flashViz()
}

const onSubCategoryChange = () => {
  flashViz()
}

const onCellChange = () => {
  flashViz()
}

const tryNow = () => {
  alert('This button would open the EPCOT demo interface.')
}

const toggleOverlay = () => {
  overlay.value = !overlay.value
  flashViz()
}

const toggleCompare = () => {
  compare.value = !compare.value
  flashViz()
}

const flashViz = () => {
  isFlashing.value = true
  setTimeout(() => {
    isFlashing.value = false
  }, 250)
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
  max-width: 1200px;
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
  font-size: 1.2rem;
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
  font-size: 0.9rem;
  transition: all 0.3s ease;
}

.hero-text .btn:hover {
  background: #0891b2;
  transform: translateY(-1px);
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

.button-content {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  flex: 1;
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

.expand-arrow {
  font-size: 0.8rem;
  color: #6b7280;
  transition: transform 0.3s ease;
  margin-left: 0.5rem;
}

.expand-arrow.rotated {
  transform: rotate(180deg);
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
  padding: 2rem 2rem 0rem 0;
}

.content-layout {
  display: grid;
  grid-template-columns: 4fr 6fr;
  gap: 2rem;
  max-width: 1200px;
  margin: 0 auto;
}

/* Description Panel */
.description-panel {
  padding-left: 2rem;
}

.description-panel h3 {
  margin: 0 0 1.5rem 0;
  font-size: 1.3rem;
  font-weight: 600;
  color: #1e293b;
}

.definition, .outputs, .examples {
  margin-bottom: 2rem;
}

.definition h4, .outputs h4, .examples h4 {
  margin: 0 0 0.75rem 0;
  font-size: 1rem;
  font-weight: 600;
  color: #374151;
}

.definition p {
  margin: 0;
  color: #64748b;
  line-height: 1.6;
}

.output-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.output-tag {
  background: #f0f9ff;
  color: #007acc;
  padding: 0.25rem 0.75rem;
  border-radius: 999px;
  font-size: 0.85rem;
  font-weight: 500;
  border: 1px solid #bae6fd;
}

.example-cards {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.example-card {
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  padding: 1rem;
  transition: all 0.3s ease;
}

.example-card:hover {
  transform: translateY(-1px);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
}

.example-title {
  font-weight: 600;
  color: #374151;
  font-size: 0.9rem;
  margin-bottom: 0.5rem;
}

.example-content {
  color: #64748b;
  font-size: 0.9rem;
  line-height: 1.5;
}

/* Visualization Panel */
.visualization-panel h3 {
  margin: 0 0 1rem 0;
  font-size: 1.1rem;
  font-weight: 600;
  color: #374151;
  border-bottom: 1px solid #e2e8f0;
  padding-bottom: 0.5rem;
}

.genome-viewer {
  height: 350px;
  border: 2px dashed #d1d5db;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
  transition: all 0.3s ease;
  margin-bottom: 1rem;
}

.genome-viewer.flash {
  border-color: #007acc;
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
}

.placeholder-content {
  text-align: center;
  color: #64748b;
}

.placeholder-icon {
  font-size: 3rem;
  margin-bottom: 0.75rem;
}

.placeholder-text {
  font-size: 1.2rem;
  font-weight: 500;
  margin-bottom: 0.5rem;
}

.placeholder-mode {
  font-size: 1rem;
  color: #9ca3af;
}

.viewer-controls {
  display: flex;
  gap: 0.75rem;
  margin-bottom: 1rem;
}

.control-btn {
  padding: 0.5rem 1rem;
  border: 1px solid #d1d5db;
  background: white;
  color: #374151;
  border-radius: 6px;
  cursor: pointer;
  font-size: 0.85rem;
  transition: all 0.3s ease;
}

.control-btn:hover {
  background: #f9fafb;
  border-color: #007acc;
}

.control-btn.active {
  background: #007acc;
  color: white;
  border-color: #007acc;
}

.legend {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  margin-bottom: 1.5rem;
}

.legend-item {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.85rem;
  color: #64748b;
}

.legend-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: #007acc;
  display: inline-block;
}

/* Responsive Design */
@media (max-width: 1024px) {
  .hero-content {
    grid-template-columns: 1fr;
    gap: 3rem;
  }
  
  .hero-text h1 {
    font-size: 2rem;
  }
  
  .use-cases-section {
    margin: 2rem 4rem;
  }
  
  .content-layout {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .controls-row {
    flex-direction: column;
    gap: 1rem;
  }
  
  .control-group {
    min-width: auto;
    width: 100%;
  }
}

@media (max-width: 768px) {
  .hero-section {
    margin: 1rem 1rem;
    padding: 3rem 1.5rem;
  }
  
  .hero-text h1 {
    font-size: 1.8rem;
  }
  
  .hero-text p {
    font-size: 1.1rem;
  }
  
  .use-cases-section {
    margin: 1rem 2rem;
  }
  
  .use-cases-header {
    padding: 1rem;
  }
  
  .controls-section {
    padding: 1rem;
  }
  
  .main-content {
    padding: 1rem;
  }
  
  .genome-viewer {
    height: 250px;
  }
  
  .placeholder-icon {
    font-size: 2.5rem;
  }
  
  .placeholder-text {
    font-size: 1rem;
  }
  
  .placeholder-mode {
    font-size: 0.9rem;
  }
}

@media (max-width: 480px) {
  .hero-section {
    margin: 0.5rem 0.5rem;
    padding: 2rem 1rem;
  }
  
  .hero-text h1 {
    font-size: 1.5rem;
  }
  
  .hero-text p {
    font-size: 1rem;
  }
  
  .use-cases-section {
    margin: 0.5rem 1rem;
  }
  
  .genome-viewer {
    height: 200px;
  }
  
  .placeholder-icon {
    font-size: 2rem;
  }
  
  .placeholder-text {
    font-size: 0.9rem;
  }
  
  .placeholder-mode {
    font-size: 0.8rem;
  }
}
</style>