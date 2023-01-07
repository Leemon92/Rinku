using System.Web;
using System.Web.Optimization;

namespace Rinku
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/jQueryLib").Include(
                      "~/Scripts/jquery-3.4.1.js",
                      "~/Scripts/jquery-3.4.1.min.js",
                      "~/Scripts/jquery.validate.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new Bundle("~/bundles/bootstrap").Include(
                        "~/Scripts/bootstrap.bundle.js",
                        "~/Scripts/bootstrap.bundle.min.js",
                        "~/Scripts/bootstrap.js",
                        "~/Scripts/bootstrap.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/tabulator-js").Include(
                        "~/Scripts/Specific/Tabulator/tabulator.min.js",
                        "~/Scripts/Specific/Tabulator/tabulator-config.js",
                        "~/Scripts/Specific/Tabulator/promise-polyfill.js"));

            bundles.Add(new ScriptBundle("~/bundles/ajax-helpers").Include(
                        "~/Scripts/Global/ajax-helpers.js"));

            bundles.Add(new ScriptBundle("~/bundles/employee").Include(
                        "~/Scripts/Specific/Employee.js"));

            bundles.Add(new ScriptBundle("~/bundles/movements").Include(
                        "~/Scripts/Specific/Movements.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/bootstrap.min.css",
                      "~/Content/bootstrap-utilities.css",
                      "~/Content/bootstrap-grid.css",
                      "~/Content/Site.css"));

            bundles.Add(new StyleBundle("~/Content/tabulator-css").Include(
                      "~/Content/tabulator_simple"));


        }
    }
}
