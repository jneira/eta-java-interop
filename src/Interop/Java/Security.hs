{-# LANGUAGE NoImplicitPrelude, MagicHash, TypeOperators,
  DataKinds, TypeFamilies, FlexibleContexts #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Java.Security
-- Copyright   :  (c) Jyothsna Srinivas 2017
--
-- License     :  BSD-style (see the file libraries/base/LICENSE)
--
-- Maintainer  :  jyothsnasrinivas17@gmail.com
-- Stability   :  provisional
-- Portability :  portable
--
-- Bindings for Java Security
--
-----------------------------------------------------------------------------

module Interop.Java.Security where

import GHC.Base
import GHC.Int
import Java.Array
import Java.Primitive
import Interop.Java.IO
import Java.Collections

-- Start java.security.SecureRandom

data {-# CLASS "java.security.SecureRandom" #-} SecureRandom = SecureRandom (Object# SecureRandom)
  deriving Class

foreign import java unsafe generateSeed :: Int -> Java SecureRandom JByteArray

foreign import java unsafe getAlgorithm :: Java SecureRandom String

foreign import java unsafe getProvider :: Int -> Java SecureRandom Provider

foreign import java unsafe next :: Int -> Java SecureRandom Int

foreign import java unsafe nextBytes :: JByteArray -> Java SecureRandom ()

foreign import java unsafe setSeed :: JByteArray -> Java SecureRandom ()

foreign import java unsafe "setSeed" setSeedLong :: Int64 -> Java SecureRandom ()

-- End java.security.SecureRandom

-- Start java.security.Provider

data {-# CLASS "java.security.Provider" #-} Provider = Provider (Object# Provider)
  deriving Class

type instance Inherits Provider = '[Properties]

-- End java.security.Provider

-- Start java.security.cert.Certificate

data {-# CLASS "java.security.cert.Certificate" #-} Certificate = Certificate (Object# Certificate)
  deriving Class

-- End java.security.cert.Certificate

-- Start java.security.cert.CodeSigner

data CodeSigner = CodeSigner @java.security.cert.Certificate
  deriving Class

-- End java.security.CodeSigner

-- Start java.security.Permission

data Permission = Permission @java.security.Permission
  deriving Class

foreign import java unsafe checkGuard :: Object -> Java Permission ()

foreign import java unsafe getActions :: Java Permission JString

foreign import java unsafe implies :: Permission -> Java Permission Bool

foreign import java unsafe newPermissionCollection :: Java Permission PermissionCollection

-- End java.security.Permission

-- Start java.security.PermissionCollection

data PermissionCollection = PermissionCollection @java.security.PermissionCollection
  deriving Class

-- End java.security.PermissionCollection

-- Start java.security.BasicPermission

data BasicPermission = BasicPermission @java.security.BasicPermission
  deriving Class

type instance Inherits BasicPermission = '[Permission, Object]

-- End java.security.BasicPermission
