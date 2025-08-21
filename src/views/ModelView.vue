<template>
  <div class="model-table">
    <el-table
      :data="models"
      style="width: 100%"
      border
      stripe
    >
      <el-table-column label="Model name">
        <template #default="scope">
          <el-link
            type="primary"
            @click="goToModel(scope.row.id)"
          >
            {{ scope.row.name }}
          </el-link>
        </template>
      </el-table-column>

      <el-table-column prop="version" label="Version" sortable />
      <el-table-column prop="features" label="Features" />
    </el-table>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

interface Model {
  id: string
  name: string
  version: string
  features: string
}

const models = ref<Model[]>([
  {
    id: 'epcot-v2',
    name: 'EPCOTv2',
    version: '2.0',
    features: 'DNA, Epigenomics, Enhanced attention, Multi-modal integration, Cross-cell generalization'
  },
  {
    id: 'epcot-v1',
    name: 'EPCOT',
    version: '1.0',
    features: 'DNA one-hot, ATAC-seq, CNN, Transformer, Multi-task outputs'
  }
])

const goToModel = (id: string) => {
  router.push(`/model/${id}`)
}
</script>

<style scoped>
.model-table {
  padding: 2rem;
  max-width: 1200px;
  margin: auto;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

/* Model name link styling with solid color */
.model-table :deep(.el-link--primary) {
  color: #0891b2;
  font-weight: 600;
  text-decoration: none;
}

.model-table :deep(.el-link--primary:hover) {
  color: #06b6d4;
}

.model-table :deep(.el-link--primary:focus) {
  color: #06b6d4;
}

.model-table :deep(.el-link--primary:active) {
  color: #06b6d4;
}

/* Override Element Plus link underline color */
.model-table :deep(.el-link--primary) {
  color: #0891b2;
  font-weight: 600;
  text-decoration: none;
}

.model-table :deep(.el-link--primary:hover) {
  color: #06b6d4;
}

.model-table :deep(.el-link--primary:focus) {
  color: #06b6d4;
}

.model-table :deep(.el-link--primary:active) {
  color: #06b6d4;
}

/* Override the underline color for all states */
.model-table :deep(.el-link--primary::after),
.model-table :deep(.el-link--primary:hover::after),
.model-table :deep(.el-link--primary:focus::after),
.model-table :deep(.el-link--primary:active::after) {
  background-color: #06b6d4 !important;
  border-bottom-color: #06b6d4 !important;
}
</style>
