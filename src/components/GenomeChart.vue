<template>
  <div class="genome-chart">
    <div class="chart-container" :class="{ flash: isFlashing }">
      <div v-if="!currentImage" class="placeholder-content">
        <div class="placeholder-text">Genome Viewer</div>
        <div class="placeholder-mode">{{ chartTitle }}</div>
      </div>
      <div v-else class="chart-image-container">
        <img 
          :src="currentImage" 
          :alt="chartTitle"
          class="chart-image"
          @load="onImageLoad"
          @error="onImageError"
        />
        <div class="chart-overlay" v-if="showOverlay">
          <div class="overlay-content">
            <h4>Input Data</h4>
            <div class="input-info">
              <span class="input-item">ATAC-seq</span>
              <span class="input-item">DNA Sequence</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
    <div class="legend">
      <span v-for="item in legendItems" :key="item" class="legend-item">
        <i class="legend-dot"></i>{{ item }}
      </span>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, watch } from 'vue'

interface Props {
  category: string
  subCategory: string
  cellType: string
  isFlashing?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  isFlashing: false
})

const emit = defineEmits<{
  overlayToggle: [value: boolean]
  compareToggle: [value: boolean]
}>()

// Chart mapping based on subcategory
const chartMapping: Record<string, string> = {
  // TF-binding
  '1000-tfs': '/images/Additional TFs.png',
  
  // Epigenomic features
  'h3k27ac': '/images/Epigenomic features.png',
  'h3k4me3': '/images/Epigenomic features.png',
  'h3k27me3': '/images/Epigenomic features.png',
  'h3k9me3': '/images/Epigenomic features.png',
  'h3k36me3': '/images/Epigenomic features.png',
  'h3k4me1': '/images/Epigenomic features.png',
  'h3k9ac': '/images/Epigenomic features.png',
  'h3k14ac': '/images/Epigenomic features.png',
  'h3k18ac': '/images/Epigenomic features.png',
  'h3k23ac': '/images/Epigenomic features.png',
  'h3k122ac': '/images/Epigenomic features.png',
  
  // Gene expression
  'rna-seq': '/images/RNA.png',
  'cage-seq': '/images/RNA.png',
  'net-cage': '/images/ NET-CAGE.png',
  
  // Enhancer activity
  'starr-seq': '/images/STARR-seq.png',
  
  // 3D chromatin
  'micro-c': '/images/Micro-C.png',
  'rcmc': '/images/Micro-C.png',
  'intact-hic': '/images/Intact Hi-C.png',
  'chia-pet': '/images/HiC.png',
  
  // Nascent RNA
  'bru-seq': '/images/Bru-seq.png',
  'tt-seq': '/images/TT-seq.png',
  'gro-seq': '/images/GRO-seq.png',
  'bruuv-seq': '/images/Bru-seq.png',
  'bruchase': '/images/Bru-seq.png',
  'pro-seq': '/images/Pro-seq.png',
  'pro-cap': '/images/Pro-seq.png',
  'gro-cap': '/images/GRO-cap.png',
  
  // RNA Strand
  'rna-strand-forward': '/images/RNA Strand.png',
  'rna-strand-reverse': '/images/RNA Strand.png',
  
  // Additional mappings for consistency
  'hic': '/images/HiC.png'
}

// Legend mapping
const legendMapping: Record<string, string[]> = {
  '1000-tfs': ['Input: ATAC', 'Input: DNA', 'Prediction: TF binding'],
  'h3k27ac': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K27ac'],
  'h3k4me3': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K4me3'],
  'h3k27me3': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K27me3'],
  'h3k9me3': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K9me3'],
  'h3k36me3': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K36me3'],
  'h3k4me1': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K4me1'],
  'h3k9ac': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K9ac'],
  'h3k14ac': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K14ac'],
  'h3k18ac': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K18ac'],
  'h3k23ac': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K23ac'],
  'h3k122ac': ['Input: ATAC', 'Input: DNA', 'Prediction: H3K122ac'],
  'rna-seq': ['Input: ATAC', 'Input: DNA', 'Prediction: RNA-seq'],
  'cage-seq': ['Input: ATAC', 'Input: DNA', 'Prediction: CAGE-seq'],
  'net-cage': ['Input: ATAC', 'Input: DNA', 'Prediction: NET-CAGE'],
  'starr-seq': ['Input: ATAC', 'Input: DNA', 'Prediction: Enhancer activity'],
  'micro-c': ['Input: ATAC', 'Input: DNA', 'Prediction: Micro-C contacts'],
  'rcmc': ['Input: ATAC', 'Input: DNA', 'Prediction: RCMC contacts'],
  'intact-hic': ['Input: ATAC', 'Input: DNA', 'Prediction: Hi-C contacts'],
  'chia-pet': ['Input: ATAC', 'Input: DNA', 'Prediction: ChIA-PET contacts'],
  'bru-seq': ['Input: ATAC', 'Input: DNA', 'Prediction: Bru-seq'],
  'tt-seq': ['Input: ATAC', 'Input: DNA', 'Prediction: TT-seq'],
  'gro-seq': ['Input: ATAC', 'Input: DNA', 'Prediction: GRO-seq'],
  'bruuv-seq': ['Input: ATAC', 'Input: DNA', 'Prediction: BruUV-seq'],
  'bruchase': ['Input: ATAC', 'Input: DNA', 'Prediction: BruChase'],
  'pro-seq': ['Input: ATAC', 'Input: DNA', 'Prediction: PRO-seq'],
  'pro-cap': ['Input: ATAC', 'Input: DNA', 'Prediction: PRO-cap'],
  'gro-cap': ['Input: ATAC', 'Input: DNA', 'Prediction: GRO-cap'],
  'rna-strand-forward': ['Input: ATAC', 'Input: DNA', 'Prediction: RNA Forward'],
  'rna-strand-reverse': ['Input: ATAC', 'Input: DNA', 'Prediction: RNA Reverse'],
  'hic': ['Input: ATAC', 'Input: DNA', 'Prediction: Hi-C contacts']
}

// Reactive state
const showOverlay = ref(false)
const showCompare = ref(false)
const imageLoaded = ref(false)
const imageError = ref(false)

// Computed properties
const currentImage = computed(() => {
  return chartMapping[props.subCategory] || null
})

const chartTitle = computed(() => {
  const categoryLabels: Record<string, string> = {
    'tf-binding': 'TF-binding',
    'epigenomic': 'Epigenomic Features',
    'gene-expression': 'Gene Expression',
    'enhancer-activity': 'Enhancer Activity',
    '3d-chromatin': '3D Chromatin Interaction',
    'nascent-rna': 'Nascent RNA Prediction',
    'rna-strand': 'RNA Strand-specific'
  }
  return categoryLabels[props.category] || 'Genome Viewer'
})

const legendItems = computed(() => {
  return legendMapping[props.subCategory] || ['Input: ATAC', 'Input: DNA', 'Prediction: Signal']
})

// Methods

const onImageLoad = () => {
  imageLoaded.value = true
  imageError.value = false
}

const onImageError = () => {
  imageError.value = true
  imageLoaded.value = false
}

// Watch for changes in subcategory to reset overlay states
watch(() => props.subCategory, () => {
  showOverlay.value = false
  showCompare.value = false
  imageLoaded.value = false
  imageError.value = false
})
</script>

<style scoped>
.genome-chart {
  width: 100%;
}

.chart-container {
  height: 350px;
  border: 2px dashed #d1d5db;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
  transition: all 0.3s ease;
  margin-bottom: 1rem;
  position: relative;
  overflow: hidden;
}

.chart-container.flash {
  border-color: #007acc;
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
}

.placeholder-content {
  text-align: center;
  color: #64748b;
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

.chart-image-container {
  position: relative;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: white;
}

.chart-image {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
  border-radius: 4px;
  
}


.chart-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.3s ease;
}

.chart-overlay:hover {
  opacity: 1;
}

.overlay-content {
  background: white;
  padding: 1rem;
  border-radius: 8px;
  text-align: center;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.overlay-content h4 {
  margin: 0 0 0.5rem 0;
  color: #374151;
  font-size: 1rem;
}

.input-info {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.input-item {
  background: #f0f9ff;
  color: #007acc;
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
  font-size: 0.85rem;
  font-weight: 500;
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
@media (max-width: 768px) {
  .chart-container {
    height: 250px;
  }
  
  .placeholder-text {
    font-size: 1rem;
  }
  
  .placeholder-mode {
    font-size: 0.9rem;
  }
}

@media (max-width: 480px) {
  .chart-container {
    height: 200px;
  }
  
  .placeholder-text {
    font-size: 0.9rem;
  }
  
  .placeholder-mode {
    font-size: 0.8rem;
  }
}
</style>
