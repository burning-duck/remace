<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
<head>
[@cms.page /]
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>${content.windowTitle!content.title!}</title>
  <meta name="description" content="${content.description!""}"/>
  <meta name="keywords" content="${content.keywords!""}"/>
  <link rel="stylesheet" type="text/css" href="${ctx.contextPath}/.resources/rehace-github-magnolia/webresources/rehace-github-magnolia-bundle.css"
        media="all"/>
  <style type="text/css">
    .main.container {
      margin-top: 5em;
    }
  </style>
</head>
<body>
[#-- Menu --]
<div class="ui fixed inverted menu">
  <div class="item">
    <img class="logo" src="${ctx.contextPath}/.resources/rehace-github-magnolia/webresources/public/assets/burning-duck-logo.png">
  </div>
  [#assign currentNode = cmsfn.asJCRNode(content)]
  [#assign rootPage = cmsfn.root(currentNode, "mgnl:page")!]
  [#if rootPage?has_content]
    <a class="header item" href="${cmsfn.link(rootPage)}">${cmsfn.asContentMap(rootPage).title!}</a>
  [#else]
    <a class="header item" href="${cmsfn.link(content)}">${content.title!}</a>
  [/#if]
</div>
[#-- Content --]
<div class="ui main text container">
  <div class="ui vertical center aligned segment">
  [#-- Header --]
    <div class="ui text container">
    [@cms.area name="headerArea"/]
    </div>
  </div>
  <div class="ui basic padded segment">
    <div class="ui three column grid">
      [@cms.area name="metricsArea"/]
    </div>
  </div>

[#-- Main --]
[@cms.area name="mainArea"/]
</div>

[#-- Check if this page is a detail page and register the project --]
[#assign currentPageTemplate = cmsfn.metaData(content, "mgnl:template")]
[#if currentPageTemplate?? && currentPageTemplate == "rehace-github-magnolia:pages/projectDetail"]
<div data-component="GithubProjectRegistration"
     data-prop-owner="${content.owner!}"
     data-prop-repo="${content.repo!}">
</div>
[/#if]
<script src="${ctx.contextPath}/.resources/rehace-github-magnolia/webresources/rehace-github-magnolia-bundle.js"></script>
</body>
</html>
