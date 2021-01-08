local mixin = (import 'github.com/kubernetes-monitoring/kubernetes-mixin/mixin.libsonnet') + ({
  _config+:: {
    grafanaK8s: {
      dashboardNamePrefix: 'Netic OaaS / ',
      dashboardTags: ['netic-oaas','kubernetes-mixin'],
      linkPrefix: '.',
      refresh: '10s',
      minimumTimeInterval: '1m',
    }
  },
});
local dashboards = mixin.grafanaDashboards;
{
  [name]: dashboards[name]
  for name in std.objectFields(dashboards)
}
