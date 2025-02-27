import type { NextPage } from 'next'
import Head from 'next/head'

import SafeAppsPermissions from '@/components/settings/SafeAppsPermissions'
import SettingsHeader from '@/components/settings/SettingsHeader'
import { SafeAppsSigningMethod } from '@/components/settings/SafeAppsSigningMethod'

const SafeAppsPermissionsPage: NextPage = () => {
  return (
    <>
      <Head>
        <title>{'KlaytnSafe{Wallet} – Settings – Safe Apps'}</title>
      </Head>

      <SettingsHeader />

      <main>
        <SafeAppsPermissions />
        <SafeAppsSigningMethod />
      </main>
    </>
  )
}

export default SafeAppsPermissionsPage
