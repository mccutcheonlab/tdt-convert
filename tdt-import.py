# -*- coding: utf-8 -*-
"""
Created on Tue Mar 12 13:20:38 2019

@author: James Rig
"""

import tdt
import numpy as np
import matplotlib.pyplot as plt

from tdt import download_demo_data


#file = 'R:\\DA_and_Reward\\fn55\\dPPP1-190322-093722\\Fabien-190329-101733'
#
#data = tdt.read_block(file, nodata=True)


fig, ax = plt.subplots()

ax.plot(data.streams.D1B2['data'], c='b')




#sip_data = tdt.epoc_filter(data, 'RT1/', t=[-1, 5])

#download_demo_data()
#BLOCK_PATH = 'data/Algernon-180308-130351'
#
#REF_EPOC     = 'PC0/'
#STREAM_STORE = 'LFP1'
#ARTIFACT     = np.inf       # optionally set an artifact rejection level
#CHANNEL      = 3
#TRANGE       = [-0.3, 0.8]  # window size [start time relative to epoc onset, window duration]
#
#
#data = tdt.read_block(BLOCK_PATH, evtype=['epocs','scalars','streams'], channel=CHANNEL)
#
#data = tdt.epoc_filter(data, 'PC0/', t=TRANGE, tref=True)
#
#art1 = np.array([np.any(x>ARTIFACT) for x in data.streams[STREAM_STORE].filtered], dtype=bool)
#art2 = np.array([np.any(x<-ARTIFACT) for x in data.streams[STREAM_STORE].filtered], dtype=bool)
#good = np.logical_not(art1) & np.logical_not(art2)
#
#data.streams[STREAM_STORE].filtered = [data.streams[STREAM_STORE].filtered[i] for i in range(len(good)) if good[i]]
#
#num_artifacts = np.sum(np.logical_not(good))
#if num_artifacts == len(art1):
#    raise Exception('all waveforms rejected as artifacts')
#    
#    
#min_length = np.min([len(x) for x in data.streams[STREAM_STORE].filtered])
#data.streams[STREAM_STORE].filtered = [x[:min_length] for x in data.streams[STREAM_STORE].filtered]
#
#all_signals = np.vstack(data.streams[STREAM_STORE].filtered)
#mean_signal = np.mean(all_signals, axis=0)
#std_signal = np.std(all_signals, axis=0)
#
#ts = TRANGE[0] + np.arange(0, min_length) / data.streams[STREAM_STORE].fs