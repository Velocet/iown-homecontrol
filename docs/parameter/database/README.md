---
template: sqliteviewer.html
title: iown-command parameter viewer
description: io-homecontrol device command parameter database viewer
status: new
hide:
  - navigation
  - toc
  - path
---
<!--
<div id="main-container" class="container shadow bg-white">
  <div class="row text-center p-3 align-items-stretch" id="dropzone" onclick="dropzoneClick(this)">
    <div class="d-flex border border-info-subtle rounded-1 align-items-center justify-content-center">
      <div id="drop-text">drop or click to open io-homecontrol db
        <a id="sample-db-link" class="no-propagate small text-decoration-none" href="../../parameter/database/iohomecontrol.sqlite"><br/><br/>load io-homecontrol db</a></div>
      <div id="drop-loading" class="d-flex align-items-center d-none"><div class="spinner-border me-2" role="status"><span class="visually-hidden">Loading...</span></div><b>Processing file...</b></div>
    </div>
  </div>
-->
  <div id="output-box" class="container-fluid">
    <div class="input-group"><select id="tables" class="form-select" title="Table"></select>
<!--
      <div class="dropdown ms-2"><button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenu1" data-bs-toggle="dropdown" aria-expanded="false">Export</button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
          <li><a class="dropdown-item" href="#" onclick="exportAllToCsv()">All tables to CSV</a></li>
          <li><a class="dropdown-item" href="#" onclick="exportSelectedTableToCsv()">Selected table to CSV</a></li>
          <li><a class="dropdown-item" href="#" onclick="exportQueryTableToCsv()">Query table to CSV</a></li>
        </ul>
      </div>
-->
    </div>
      <div class="d-flex mt-3 mb-3"><div id="sql-editor" class="form-control form-control-lg col me-2"></div><button class="btn btn-primary col-auto" id="sql-run" type="submit" onclick="executeSql(this)">Execute</button></div>
      <div class="alert alert-danger" id="error" style="display: none"></div>
      <div class="alert alert-info" id="info" style="display: none"></div>
      <div class="row pb-4"><div class="overflow-x-auto"><table id="data" class="table table-sm table-bordered table-hover table-striped"><thead><tr></tr></thead><tbody class="table-group-divider"></tbody></table></div></div>
  </div>
<!-- </div> -->
<div id="bottom-bar" class="d-flex position-sticky justify-content-center bottom-0 pb-4 d-none pe-none">
    <div class="row bg-white border border-dark shadow p-3 rounded-2 pe-auto">
        <button class="btn btn-outline-secondary btn-sm lh-1 col-auto" id="page-prev" type="submit" onclick="setPage(this, false)">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-left-fill" viewBox="0 0 16 16">
                <path d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
            </svg>
        </button>
        <a href="javascript:void(0)" data-bs-toggle="tooltip" class="text-decoration-none col-auto" onclick="setPage(this)" id="pager"></a>
        <button class="btn btn-outline-secondary btn-sm lh-1 col-auto" id="page-next" type="submit" onclick="setPage(this, true)">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
            </svg>
        </button>
    </div>
</div>

<!-- <input type="file" id="dropzone-dialog" style="opacity: 0;display:none"> -->
