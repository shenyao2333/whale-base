<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="奖品类型" prop="prizeType">
        <el-select v-model="queryParams.prizeType" placeholder="请选择奖品类型" clearable size="small">
          <el-option
            v-for="dict in prizeTypeOptions"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="奖品名称" prop="prizeName">
        <el-input
          v-model="queryParams.prizeName"
          placeholder="请输入奖品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="奖品状态" prop="prizeStatus">
        <el-select v-model="queryParams.prizeStatus" placeholder="请选择奖品状态" clearable size="small">
          <el-option
            v-for="dict in prizeStatusOptions"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="RcPrizeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键id" align="center" prop="prizeId" />
      <el-table-column label="奖品类型" align="center" prop="prizeType" :formatter="prizeTypeFormat" />
      <el-table-column label="奖品名称" align="center" prop="prizeName" />
      <el-table-column label="奖品图标" align="center" prop="prizeIcon" >
        <template slot-scope="scope">
          <el-image :src="scope.row.prizeIcon" style="width: 60px; height: 60px"
                    :preview-src-list="[scope.row.prizeIcon]" alt="图片" />
        </template>
      </el-table-column>

      <el-table-column label="奖品状态" align="center" prop="prizeStatus" >
        <template slot-scope="scope">
          <el-switch :value ="scope.row.prizeStatus===1">
          </el-switch>
        </template>
      </el-table-column>
      <el-table-column label="跳转类型" align="center" prop="jumpType" :formatter="jumpTypeFormat" />
      <el-table-column label="数量" align="center" prop="totalQuantity" />
      <el-table-column label="已发数量" align="center" prop="langleyQuantity" />
      <el-table-column label="红包金额" align="center" prop="rePacketWorth" />
      <el-table-column label="已发金额" align="center" prop="yetRePacketWorth" />
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.current"
      :limit.sync="queryParams.size"
      @pagination="getList"
    />

  </div>
</template>

<script>
import { listrcPrize } from "@/api/rc/prize";

export default {
  name: "rcPrize",
  props :{
    prizeTypeList:[]
  },
  data() {
    return {
      queryParams: {
        current: 1,
        size: 10,
        prizeType: null,
        prizeName: null,
        prizeStatus: null

      },
      prizeInfo:{

      },
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 奖品表格数据
      RcPrizeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 奖品类型字典
      prizeTypeOptions: [],
      // 奖品状态字典
      prizeStatusOptions: [],
      // 跳转类型字典
      jumpTypeOptions: [],
      // 查询参数
    };
  },
  created() {
    this.getList();
    this.getDicts("goods_type").then(response => {
      this.prizeTypeOptions = response.data;
    });
    this.getDicts("rc_status").then(response => {
      this.prizeStatusOptions = response.data;
    });
    this.getDicts("jump_type").then(response => {
      this.jumpTypeOptions = response.data;
    });
  },
  methods: {
    /** 查询奖品列表 */
    getList() {
      this.loading = true;
      let  pram = this.queryParams;
      pram['prizeTypeListStr'] = this.prizeTypeList;
      listrcPrize(pram).then(response => {
        this.RcPrizeList = response.data;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 奖品类型字典翻译
    prizeTypeFormat(row, column) {
      return this.selectDictLabel(this.prizeTypeOptions, row.prizeType);
    },
    // 奖品状态字典翻译
    prizeStatusFormat(row, column) {
      return this.selectDictLabel(this.prizeStatusOptions, row.prizeStatus);
    },
    // 跳转类型字典翻译
    jumpTypeFormat(row, column) {
      return this.selectDictLabel(this.jumpTypeOptions, row.jumpType);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.current = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.prizeInfo= selection[0];
      this.ids = selection.map(item => item.prizeId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
  }
};
</script>
