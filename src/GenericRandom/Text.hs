{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UndecidableInstances #-}

module GenericRandom.Text where

import Data.Text
import Data.Text qualified as T
import GHC.Generics
import Generic.Random
import Test.QuickCheck

arbitraryAlphabetChar :: Gen Char
arbitraryAlphabetChar = elements ['a' .. 'z']

instance Arbitrary Text where
  arbitrary :: Gen Text
  -- arbitrary = T.pack . getPrintableString <$> arbitrary
  -- arbitrary = T.pack . getASCIIString <$> arbitrary
  arbitrary = T.pack <$> vectorOf 10 arbitraryAlphabetChar

instance Generic Text where
  type
    Rep Text =
      D1
        ('MetaData "Text" "Data.Text" "GenericRandom-Text" 'False)
        (C1 ('MetaCons "TextFakeConstructor" 'PrefixI 'False) U1)

data Something = Something Text (Maybe Text)
  -- data Something = Something String (Maybe String)
  deriving (Generic, Show)

-- instance (BaseCase Something) => Arbitrary Something where
instance Arbitrary Something where
  arbitrary = genericArbitrary' uniform

main :: IO ()
main = do
  value <- generate (arbitrary @Something)
  print value
