import Paths_dyreExample (getLibDir)

dyreExample cfg = do
  libdir <- getLibDir
  let params = (Dyre.newParams "dyreExample" realMain showError)
      { Dyre.includeDirs = [libdir] }
  Dyre.wrapMain params cfg
