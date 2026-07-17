// Copyright (c) 2022 The Vitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

/**
 * Utility functions for RPC commands
 */
#ifndef VTCCOIN_WALLET_UTIL_H
#define VTCCOIN_WALLET_UTIL_H

#include "fs.h"
#include "util.h"

fs::path GetBackupDirFromInput(std::string strUserFilename);

#endif // VTCCOIN_WALLET_UTIL_H
