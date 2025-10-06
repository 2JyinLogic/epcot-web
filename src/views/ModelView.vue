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
          <span
            class="model-name-link"
            @click="goToModel(scope.row.id)"
          >
            {{ scope.row.name }}
          </span>
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
  padding: 1rem;
  padding-top: 8rem;
  max-width: 1200px;
  margin: 0 auto;
  font-family: Arial, sans-serif;
  background: var(--bg);
  min-height: auto;
}

/* ===== 强化表格网格线显示 ===== */
.model-table :deep(.el-table) {
  background: var(--panel);
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  border: 2px solid var(--line);
}

.model-table :deep(.el-table__header-wrapper) {
  background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
}

/* ===== 表头网格线 ===== */
.model-table :deep(.el-table th) {
  background: transparent;
  color: #1e293b;
  font-weight: 600;
  font-size: 0.95rem;
  border-bottom: 2px solid var(--line) !important;
  border-right: 2px solid var(--line) !important;
  border-top: 1px solid var(--line) !important;
  border-left: 1px solid var(--line) !important;
  padding: 1rem 0.75rem;
}

.model-table :deep(.el-table th:first-child) {
  border-left: 2px solid var(--line) !important;
}

.model-table :deep(.el-table th:last-child) {
  border-right: 2px solid var(--line) !important;
}

/* ===== 表格主体网格线 ===== */
.model-table :deep(.el-table td) {
  padding: 1rem 0.75rem;
  border-bottom: 1px solid var(--line) !important;
  border-right: 1px solid var(--line) !important;
  border-left: 1px solid var(--line) !important;
  transition: background-color 0.3s ease;
}

.model-table :deep(.el-table td:first-child) {
  border-left: 2px solid var(--line) !important;
}

.model-table :deep(.el-table td:last-child) {
  border-right: 2px solid var(--line) !important;
}

/* ===== 最后一行底部边框 ===== */
.model-table :deep(.el-table tbody tr:last-child td) {
  border-bottom: 2px solid var(--line) !important;
}

/* ===== 悬停效果 ===== */
.model-table :deep(.el-table tbody tr:hover td) {
  background-color: #f8fafc;
}

.model-table :deep(.el-table tbody tr:nth-child(even)) {
  background-color: #fafbfc;
}

.model-table :deep(.el-table tbody tr:nth-child(even):hover) {
  background-color: #f0f9ff;
}

/* ===== 使用 Element Plus 内部类强化边框 ===== */
.model-table :deep(.el-table--border .el-table__cell) {
  border-right: 1px solid var(--line) !important;
  border-bottom: 1px solid var(--line) !important;
  border-left: 1px solid var(--line) !important;
}

.model-table :deep(.el-table--border .el-table__cell:first-child) {
  border-left: 2px solid var(--line) !important;
}

.model-table :deep(.el-table--border .el-table__cell:last-child) {
  border-right: 2px solid var(--line) !important;
}

.model-table :deep(.el-table--border .el-table__header .el-table__cell) {
  border-bottom: 2px solid var(--line) !important;
  border-top: 1px solid var(--line) !important;
}

.model-table :deep(.el-table--border .el-table__header .el-table__cell:first-child) {
  border-left: 2px solid var(--line) !important;
}

.model-table :deep(.el-table--border .el-table__header .el-table__cell:last-child) {
  border-right: 2px solid var(--line) !important;
}

.model-table :deep(.el-table--border .el-table__row:last-child .el-table__cell) {
  border-bottom: 2px solid var(--line) !important;
}

/* ===== 优化模型名称链接样式 ===== */
.model-name-link {
  color: var(--accent);
  font-weight: 600;
  cursor: pointer;
  transition: color 0.2s ease;
  text-decoration: none;
}

.model-name-link:hover {
  color: #0371a8;
}

.model-name-link:focus {
  color: var(--accent);
  outline: none;
}

.model-name-link:active {
  color: #036498;
}

/* ===== 版本标签样式 ===== */
.model-table :deep(.el-table td:nth-child(2)) {
  font-weight: 600;
  color: var(--accent);
}

/* ===== 特性列样式 ===== */
.model-table :deep(.el-table td:nth-child(3)) {
  color: var(--muted);
  line-height: 1.5;
  font-size: 0.9rem;
}

/* ===== 响应式设计 ===== */
@media (max-width: 768px) {
  .model-table {
    padding: 0.5rem;
    padding-top: 3rem;
  }
  
  .model-table :deep(.el-table th),
  .model-table :deep(.el-table td) {
    padding: 0.75rem 0.5rem;
    font-size: 0.85rem;
  }
}
</style>
