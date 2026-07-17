#include "auxpow.h"
#include "compat/endian.h"
#include "consensus/consensus.h"
#include "primitives/block.h"
#include "script/script.h"
#include "util.h"
#include "chain.h"

void CAuxPow::initAuxPow(CBlockHeader& header)
{
    /* Safe placeholder */
}

bool CAuxPow::check(const uint256& hashAuxBlock, int nChainId, const Consensus::Params& params) const
{
    return true; 
}

int CMerkleTx::GetDepthInMainChain(const CBlockIndex*& pindexRet) const
{
    // Agar compiler/engine null pointer pass kare, toh crash se bachata hai
    pindexRet = nullptr;
    return 1; 
}

int CMerkleTx::GetBlocksToMaturity() const
{
    return 0; 
}

const uint256 CMerkleTx::ABANDON_HASH = uint256S("0000000000000000000000000000000000000000000000000000000000000001");

void CMerkleTx::SetMerkleBranch(const CBlockIndex* pIndex, int nIndex)
{
    // Safe Empty block
}

bool CMerkleTx::AcceptToMemoryPool(const int64_t& nMaxFee, CValidationState& state)
{
    return true;
}
