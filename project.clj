(defproject sicp "0.1.0-SNAPSHOT"
  :description "Reading through sicp..."
  :url "http://github.com/jamesclyeh/sicp"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.1"]]
  :main ^:skip-aot sicp.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
